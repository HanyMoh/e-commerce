class AddCampaignIdToCoupons < ActiveRecord::Migration[5.1]
  def change
    add_reference :coupons, :campaign
  end
end
