class AddButtonNameToCampaignCoupon < ActiveRecord::Migration[5.1]
  def change
    add_column :campaign_coupons, :button_name, :string
  end
end
