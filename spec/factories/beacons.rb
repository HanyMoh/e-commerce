# == Schema Information
#
# Table name: beacons
#
#  id                :bigint(8)        not null, primary key
#  beacon_type       :string
#  latitude          :integer
#  longitude         :integer
#  major             :integer
#  message_frequency :integer
#  minor             :integer
#  name              :string
#  pos_x             :string
#  pos_y             :string
#  range             :integer
#  status            :boolean          default(FALSE)
#  uuid              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  brand_id          :bigint(8)
#  organization_id   :bigint(8)
#  remote_id         :integer
#  shop_id           :integer
#
# Indexes
#
#  index_beacons_on_brand_id         (brand_id)
#  index_beacons_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id)
#

FactoryBot.define do
  factory :beacon do
    major { Faker::Number.between(1, 100) }
    minor { Faker::Number.between(1, 100) }
    message_frequency [60, 300, 900, 1800, 2700, 3600, 7200, 10_800, 21_600, 43_200, 86_400].sample
    shop
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    name { Faker::Name.unique.name }
    brand
    uuid { Faker::Base.numerify('##') }
    organization
    status [true, false].sample
  end
end
