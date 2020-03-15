# == Schema Information
#
# Table name: floors
#
#  id              :bigint(8)        not null, primary key
#  angle           :float
#  floor_number    :integer
#  lat             :float
#  logo            :string
#  long            :float
#  name            :string
#  opacity         :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  building_id     :bigint(8)
#  organization_id :bigint(8)
#
# Indexes
#
#  index_floors_on_building_id      (building_id)
#  index_floors_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (building_id => buildings.id)
#

FactoryBot.define do
  factory :floor do
    logo { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/logo.png'), 'image/png') }
    organization
    building
    name { Faker::Name.unique.name }
    floor_number { Faker::Number.number(1) }
    lat { Faker::Address.latitude }
    long { Faker::Address.longitude }
    angle [45.0, 80.0].sample
    opacity [0.2, 0.6].sample
  end
end
