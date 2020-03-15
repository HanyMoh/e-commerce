class RenameJsonDataToWebJsonDataInShop360s < ActiveRecord::Migration[5.1]
  def change
    rename_column :shop360s, :json_data, :web_json_data
  end
end
