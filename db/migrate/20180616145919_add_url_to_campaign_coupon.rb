class AddUrlToCampaignCoupon < ActiveRecord::Migration[5.1]
  def change
    add_column :campaign_coupons, :url, :string
  end
end
