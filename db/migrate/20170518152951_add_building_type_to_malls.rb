class AddBuildingTypeToMalls < ActiveRecord::Migration[5.1]
  def change
    add_column :malls, :building_type, :string
  end
end
