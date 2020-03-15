class Organization < ApplicationRecord
  self.inheritance_column = ''
  before_save :set_parameterized_name

  has_many :brands, dependent: :destroy
  has_many :products, dependent: :destroy

  # Deprecated
  has_many :buildings

  has_many :shops, through: :brands
  has_many :roles, dependent: :destroy
  has_one :social_link, dependent: :destroy
  has_one :feature, dependent: :destroy
  has_one :organization_theme, dependent: :destroy
  has_one :organization_manager, dependent: :destroy
  has_one :organization_plan, dependent: :destroy

  validates :name, uniqueness: true

  accepts_nested_attributes_for :feature
  accepts_nested_attributes_for :social_link
  accepts_nested_attributes_for :organization_theme
  accepts_nested_attributes_for :organization_plan

  scope :newest_first, -> { order('created_at desc') }

  def set_parameterized_name
    self.p_name = name.parameterize
  end
end
