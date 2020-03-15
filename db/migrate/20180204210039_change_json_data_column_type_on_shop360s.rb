class ChangeJsonDataColumnTypeOnShop360s < ActiveRecord::Migration[5.1]
  def change
    change_column :shop360s, :web_json_data, :text
    change_column :shop360s, :mobile_json_data, :text
  end
end
