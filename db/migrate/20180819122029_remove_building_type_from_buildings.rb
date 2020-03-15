class RemoveBuildingTypeFromBuildings < ActiveRecord::Migration[5.1]
  def change
    remove_column :buildings,:building_type
  end
end
