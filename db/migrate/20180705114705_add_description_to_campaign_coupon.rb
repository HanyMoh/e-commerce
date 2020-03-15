class AddDescriptionToCampaignCoupon < ActiveRecord::Migration[5.1]
  def change
  	add_column :campaign_coupons,:description,:string
  end
end
