class RenameLocationIdInNewsLocations < ActiveRecord::Migration[5.1]
  def change
    rename_column :news_locations, :location_id, :shop_id
  end
end
