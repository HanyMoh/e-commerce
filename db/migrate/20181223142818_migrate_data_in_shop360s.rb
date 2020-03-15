class MigrateDataInShop360s < ActiveRecord::Migration[5.1]
  def change
    Shop360.all.each do |s|
      s.preview_json_data = s.web_json_data
      s.save
    end
  end
end
