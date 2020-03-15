# == Schema Information
#
# Table name: buildings
#
#  id              :bigint(8)        not null, primary key
#  address         :text
#  area            :string
#  banner          :string
#  building_type   :string
#  close_at        :time
#  description     :text
#  floors_count    :integer          default(0)
#  latitude        :decimal(10, 6)
#  logo            :string
#  longitude       :decimal(10, 6)
#  name            :string
#  open_at         :time
#  p_name          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint(8)
#
# Indexes
#
#  index_buildings_on_organization_id  (organization_id)
#

FactoryBot.define do
  factory :building do
    name { Faker::Name.unique.name }
    address { Faker::Address.full_address }
    longitude { Faker::Address.latitude }
    latitude { Faker::Address.longitude }
    logo { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/logo.png'), 'image/png') }
    description { Faker::Lorem.paragraph }
    banner { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/product.jpg'), 'image/jpeg') }
  end
end
