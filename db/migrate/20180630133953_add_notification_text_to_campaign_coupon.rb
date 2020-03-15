class AddNotificationTextToCampaignCoupon < ActiveRecord::Migration[5.1]
  def change
    add_column :campaign_coupons,:notification_text,:string
    add_column :campaign_coupons,:message_text,:string
    remove_column :campaign_coupons,:coupon_type
  end
end
