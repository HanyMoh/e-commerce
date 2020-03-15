class ShopSection < ApplicationRecord
  serialize :web_json_data
  mount_uploader :image, ImageUploader

  has_many :scenes, dependent: :destroy
  belongs_to :shop_floor

  accepts_nested_attributes_for :scenes, allow_destroy: true,
                                         reject_if: ->(a) { a[:name].blank? }

  validates :name, presence: true

  default_scope { order(created_at: :asc) }
end
