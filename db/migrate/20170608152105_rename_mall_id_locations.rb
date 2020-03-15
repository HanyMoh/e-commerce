class RenameMallIdLocations < ActiveRecord::Migration[5.1]
  def change
    rename_column :locations, :mall_id, :building_id
  end
end
