# == Schema Information
#
# Table name: shop360s
#
#  id                 :bigint(8)        not null, primary key
#  mobile_json_data   :text
#  preview_json_data  :text
#  published          :boolean          default(FALSE)
#  scene_asset_bundle :string
#  scene_name         :string
#  url                :string
#  web_json_data      :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  shop_id            :bigint(8)
#
# Indexes
#
#  index_shop360s_on_shop_id  (shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (shop_id => shops.id)
#

FactoryBot.define do
  factory :shop360 do
    shop
    url { Faker::Internet.url }
    scene_name { Faker::Name.unique.name }
  end
end
