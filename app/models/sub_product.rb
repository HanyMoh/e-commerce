class SubProduct < ApplicationRecord
  mount_uploader :cover_image, ImageUploader
  mount_uploaders :gallery, ImageUploader

  has_many :stocks, dependent: :destroy
  has_many :shops, through: :stocks
  has_many :entries
  has_one :category, through: :product
  belongs_to :organization
  belongs_to :brand
  belongs_to :product

  validates :barcode, presence: true
  validates :barcode, uniqueness: { case_sensitive: true, scope: :organization_id }
  validates :barcode, numericality: { greater_than_or_equal_to: 0 }
  validates :price, :discount, numericality: { greater_than_or_equal_to: 0 }

  scope :newest_first, -> { order('created_at desc') }
  scope :by_barcode, ->(barcode) { find_by(barcode: barcode) }
  scope :by_shop, ->(shop_id) { where(shop_id: shop_id) }

  accepts_nested_attributes_for :stocks, allow_destroy: true,
                                         reject_if: ->(a) { a[:quantity].blank? }
end
