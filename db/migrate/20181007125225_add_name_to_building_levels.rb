class AddNameToBuildingLevels < ActiveRecord::Migration[5.1]
  def change
    add_column :building_levels, :name, :string
  end
end
