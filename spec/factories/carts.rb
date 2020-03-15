# == Schema Information
#
# Table name: carts
#
#  id         :bigint(8)        not null, primary key
#  active     :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  brand_id   :bigint(8)
#  shop_id    :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_carts_on_brand_id  (brand_id)
#  index_carts_on_shop_id   (shop_id)
#  index_carts_on_user_id   (user_id)
#

FactoryBot.define do
  factory :cart do
    user
    brand
    shop
    active [true, false].sample
  end
end
