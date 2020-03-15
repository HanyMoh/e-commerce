class ShopFloor < ApplicationRecord
  has_many :shop_sections, dependent: :destroy
  belongs_to :shop360

  validates :number, :name, presence: true
  validates :number, uniqueness: { scope: :shop360_id }

  accepts_nested_attributes_for :shop_sections, allow_destroy: true,
                                                reject_if: ->(a) { a[:name].blank? }

  default_scope { order(created_at: :asc) }

  scope :newest_first, -> { order('created_at desc') }
end
