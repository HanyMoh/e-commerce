class RenameMallLevelsToBuildingLevels < ActiveRecord::Migration[5.1]
  def change
    rename_table :mall_levels, :building_levels
    rename_column :building_levels, :mall_id, :building_id
  end
end
