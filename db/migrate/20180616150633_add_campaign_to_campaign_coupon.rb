class AddCampaignToCampaignCoupon < ActiveRecord::Migration[5.1]
  def change
    add_reference :campaign_coupons, :campaign, foreign_key: true
  end
end
