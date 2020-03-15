class AddPreviewJsonDataToShop360s < ActiveRecord::Migration[5.1]
  def change
    add_column :shop360s, :preview_json_data, :text
  end
end
