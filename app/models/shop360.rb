class Shop360 < ApplicationRecord
  serialize :preview_json_data
  serialize :web_json_data

  has_many :shop_floors, dependent: :destroy
  has_many :sections, dependent: :destroy
  belongs_to :shop
  has_one :product_position

  scope :newest_first, -> { order('created_at desc') }
end
