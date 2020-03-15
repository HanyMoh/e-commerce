class Category < ApplicationRecord
  acts_as_tree order: 'name'
  before_save :set_parameterized_name

  mount_uploader :logo, ImageUploader

  # self referential associations
  has_many :sub_categories, class_name: 'Category', foreign_key: 'parent_id'
  has_many :brands, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :sub_products, through: :products
  belongs_to :parent, class_name: 'Category', optional: true

  accepts_nested_attributes_for :sub_categories, allow_destroy: true,
                                                 reject_if: ->(a) { a[:name].blank? }

  validates :name, presence: true

  scope :parent_categories, -> { where(parent_id: nil) }
  scope :newest_first, -> { order(created_at: :desc) }

  def set_parameterized_name
    self.p_name = name.parameterize
  end
end
