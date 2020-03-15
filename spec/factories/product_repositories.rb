# == Schema Information
#
# Table name: product_repositories
#
#  id          :bigint(8)        not null, primary key
#  barcode     :string
#  cover_image :string
#  description :text
#  name        :string
#  price       :float            default(0.0)
#  temp_image  :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :product_repository do
    price { Faker::Commerce.price(5..1000.0, false) }
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    cover_image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/product.jpg'), 'image/jpeg') }
    barcode { Faker::Code.ean }
  end
end
