# == Schema Information
#
# Table name: campaign_social_profiles
#
#  id          :bigint(8)        not null, primary key
#  gender      :boolean
#  max         :integer
#  min         :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  campaign_id :bigint(8)
#
# Indexes
#
#  index_campaign_social_profiles_on_campaign_id  (campaign_id)
#
# Foreign Keys
#
#  fk_rails_...  (campaign_id => campaigns.id)
#

class CampaignSocialProfileSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :min, :max
end
