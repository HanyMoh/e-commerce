class AddPreviewJsonDataToProductPositions < ActiveRecord::Migration[5.1]
  def change
    add_column :product_positions, :preview_json_data, :text
  end
end
