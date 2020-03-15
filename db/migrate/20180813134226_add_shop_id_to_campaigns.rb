class AddShopIdToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_reference :campaigns, :shop, foreign_key: true
  end
end
