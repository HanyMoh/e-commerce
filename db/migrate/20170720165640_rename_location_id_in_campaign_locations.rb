class RenameLocationIdInCampaignLocations < ActiveRecord::Migration[5.1]
  def change
    rename_column :campaign_locations, :location_id, :shop_id
  end
end
