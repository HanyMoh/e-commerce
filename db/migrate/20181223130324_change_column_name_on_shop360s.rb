class ChangeColumnNameOnShop360s < ActiveRecord::Migration[5.1]
  def change
    rename_column :shop360s, :preview_json_data, :published
  end
end
