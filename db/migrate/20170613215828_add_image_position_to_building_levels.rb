class AddImagePositionToBuildingLevels < ActiveRecord::Migration[5.1]
  def change
    add_column :building_levels, :image_position, :text, null: false, default: '[]'
    add_column :building_levels, :image_rotation, :float, null: false, default: 0
  end
end
