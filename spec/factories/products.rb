# == Schema Information
#
# Table name: products
#
#  id              :bigint(8)        not null, primary key
#  barcode         :string
#  colors          :string           default([]), is an Array
#  cover_image     :string
#  description     :string
#  discount        :float
#  ean             :string
#  info_updated    :boolean          default(FALSE)
#  name            :string
#  old_name        :string
#  p_name          :string
#  p_old_name      :string
#  price           :float
#  quantity        :integer
#  sizes           :string           default([]), is an Array
#  temp_image      :string
#  vr_slider       :string           default([]), is an Array
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  brand_id        :bigint(8)
#  category_id     :bigint(8)
#  item_id         :string
#  organization_id :bigint(8)
#
# Indexes
#
#  index_products_on_brand_id         (brand_id)
#  index_products_on_category_id      (category_id)
#  index_products_on_organization_id  (organization_id)
#

FactoryBot.define do
  factory :product do
    name { Faker::Name.unique.name }
    old_name { Faker::Commerce.product_name }
    p_name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    barcode { Faker::Code.ean }
    ean { Faker::Code.ean }
    price { Faker::Commerce.price(5..1000.0, false) }
    discount { Faker::Commerce.price(5..20.0, false) }
    quantity { Faker::Number.between(1, 100) }
    cover_image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/product.jpg'), 'image/jpeg') }
    category
    organization
    brand
    colors [Faker::Color.hex_color, Faker::Color.hex_color]
    sizes [Faker::Base.numerify('#x'), Faker::Base.numerify('#x')]
  end
end
