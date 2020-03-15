class CreateShopSections < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_sections do |t|
      t.references :shop_floor, index: true, foreign_key: true
      t.references :organization, index: true, foreign_key: true
      t.string :name
      t.text :web_json_data
      t.text :mobile_json_data
      t.timestamps
    end
  end
end
