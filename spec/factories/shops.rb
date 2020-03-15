# == Schema Information
#
# Table name: shops
#
#  id              :bigint(8)        not null, primary key
#  address         :string
#  banner          :string
#  city            :string
#  country         :string
#  enable_logo     :boolean          default(TRUE)
#  floor           :string
#  lat             :decimal(10, 6)
#  lng             :decimal(10, 6)
#  logo            :string
#  name            :string
#  p_street        :string
#  phone_number    :string
#  street          :string
#  street_number   :string
#  time_from       :datetime
#  time_to         :datetime
#  view_image      :string
#  work_days       :string           default([]), is an Array
#  work_times      :text
#  zip             :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  brand_id        :integer
#  building_id     :integer
#  organization_id :bigint(8)
#  remote_id       :integer
#
# Indexes
#
#  index_shops_on_organization_id  (organization_id)
#

require 'faker'

FactoryBot.define do
  factory :shop do
    name { Faker::Name.unique.name }
    country { Faker::Address.country }
    city { Faker::Address.city }
    zip { Faker::Address.zip }
    street { Faker::Address.street_name }
    street_number { Faker::Base.numerify('##') }
    floor { Faker::Base.numerify('#') }
    phone_number { Faker::Base.numerify('010########') }
    brand
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    organization
    logo { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/logo.png'), 'image/png') }
    p_street { Faker::Address.street_name }
    address { Faker::Address.full_address }
  end
end
