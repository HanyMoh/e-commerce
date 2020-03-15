# == Schema Information
#
# Table name: organizations
#
#  id          :bigint(8)        not null, primary key
#  description :string
#  name        :string
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :organization do
    name { Faker::Company.name }
  end
end
