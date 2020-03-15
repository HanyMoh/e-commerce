# == Schema Information
#
# Table name: campaigns
#
#  id                      :bigint(8)        not null, primary key
#  beacons                 :integer          is an Array
#  bg_color                :string
#  bg_img                  :string
#  bg_left_color           :string
#  bg_right_color          :string
#  bg_type                 :integer
#  description             :string
#  enabled                 :boolean          default(FALSE)
#  end_time                :datetime
#  header_color            :string
#  header_txt              :string
#  header_txt_color        :string
#  header_txt_type         :string
#  header_type             :integer          default("round_shape")
#  name                    :string
#  product_circle_color    :string
#  product_img             :string
#  product_name            :string
#  product_price           :float
#  product_price_txt_color :string
#  product_price_txt_type  :string
#  product_txt_color       :string
#  product_txt_type        :string
#  product_type            :integer
#  start_time              :datetime
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  brand_id                :bigint(8)
#  organization_id         :bigint(8)
#  remote_id               :integer
#  shop_id                 :bigint(8)
#
# Indexes
#
#  index_campaigns_on_brand_id         (brand_id)
#  index_campaigns_on_organization_id  (organization_id)
#  index_campaigns_on_shop_id          (shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (shop_id => shops.id)
#

FactoryBot.define do
  factory :campaign do
    name { Faker::Name.unique.name }
    description { Faker::Lorem.paragraph }
    start_time { Faker::Date.forward(2) }
    end_time { Faker::Date.forward(5) }
    enabled [true, false].sample
    organization
    beacons [1]
    shop
    header_type %i[round_shape rectangular_shape].sample
    header_color { Faker::Color.hex_color }
    header_txt { Faker::Name.unique.name }
    header_txt_color { Faker::Color.hex_color }
    product_type %i[one two three].sample
    product_img { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/product.jpg'), 'image/jpeg') }
    product_name { Faker::Name.unique.name }
    product_txt_color { Faker::Color.hex_color }
    product_price { Faker::Commerce.price(5..1000.0, false) }
    product_price_txt_color { Faker::Color.hex_color }
    product_circle_color { Faker::Color.hex_color }
    bg_type %i[color gradient image].sample
    bg_img { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/product.jpg'), 'image/jpeg') }
    bg_left_color { Faker::Color.hex_color }
    bg_right_color { Faker::Color.hex_color }
    bg_color { Faker::Color.hex_color }
  end
end
