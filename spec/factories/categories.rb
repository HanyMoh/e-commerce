# == Schema Information
#
# Table name: categories
#
#  id         :bigint(8)        not null, primary key
#  logo       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => categories.id) ON DELETE => cascade
#

FactoryBot.define do
  factory :category do
    name { Faker::Name.unique.name }
  end
end
