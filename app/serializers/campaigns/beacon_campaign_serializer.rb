class Campaigns::BeaconCampaignSerializer < CampaignSerializer
  has_one :brand
  has_one :organization
  has_one :campaign_coupon
  has_one :timeframe
  has_one :campaign_social_profile
end
