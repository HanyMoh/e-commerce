# == Schema Information
#
# Table name: campaigns
#
#  id                      :bigint(8)        not null, primary key
#  beacons                 :integer          is an Array
#  bg_color                :string
#  bg_img                  :string
#  bg_left_color           :string
#  bg_right_color          :string
#  bg_type                 :integer
#  description             :string
#  enabled                 :boolean          default(FALSE)
#  end_time                :datetime
#  header_color            :string
#  header_txt              :string
#  header_txt_color        :string
#  header_txt_type         :string
#  header_type             :integer          default("round_shape")
#  name                    :string
#  product_circle_color    :string
#  product_img             :string
#  product_name            :string
#  product_price           :float
#  product_price_txt_color :string
#  product_price_txt_type  :string
#  product_txt_color       :string
#  product_txt_type        :string
#  product_type            :integer
#  start_time              :datetime
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  brand_id                :bigint(8)
#  organization_id         :bigint(8)
#  remote_id               :integer
#  shop_id                 :bigint(8)
#
# Indexes
#
#  index_campaigns_on_brand_id         (brand_id)
#  index_campaigns_on_organization_id  (organization_id)
#  index_campaigns_on_shop_id          (shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (shop_id => shops.id)
#

class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :start_time, :end_time
end
