# == Schema Information
#
# Table name: orders
#
#  id                  :bigint(8)        not null, primary key
#  address             :string(150)
#  cancelation_reasons :string           default([]), is an Array
#  date_delivery       :datetime
#  email               :string(40)
#  name                :string(40)
#  payment_type        :integer          default(0)
#  status              :integer          default("in_progess")
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  organization_id     :bigint(8)
#  user_id             :bigint(8)
#
# Indexes
#
#  index_orders_on_organization_id  (organization_id)
#  index_orders_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'faker'

FactoryBot.define do
  factory :order do
    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    payment_type 1
    user
    address { Faker::Address.full_address }
    date_delivery { Faker::Date.between(Date.today, Date.today + 2.days) }
    organization
    status :in_progess
  end
end
