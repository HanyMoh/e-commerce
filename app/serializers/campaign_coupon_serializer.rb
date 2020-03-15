# == Schema Information
#
# Table name: campaign_coupons
#
#  id                 :bigint(8)        not null, primary key
#  button_name        :string
#  description        :string
#  hight_screen_image :string
#  message_text       :string
#  name               :string
#  notification_text  :string
#  url                :string
#  width_screen_image :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  campaign_id        :bigint(8)
#
# Indexes
#
#  index_campaign_coupons_on_campaign_id  (campaign_id)
#
# Foreign Keys
#
#  fk_rails_...  (campaign_id => campaigns.id)
#

class CampaignCouponSerializer < ActiveModel::Serializer
  attributes :name, :message_text, :notification_text, :hight_screen_image, :width_screen_image, :url
end
