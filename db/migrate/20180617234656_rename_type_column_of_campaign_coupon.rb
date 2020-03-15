class RenameTypeColumnOfCampaignCoupon < ActiveRecord::Migration[5.1]
  def change
  	rename_column :campaign_coupons,:type,:coupon_type
  end
end
