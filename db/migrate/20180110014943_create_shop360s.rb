class CreateShop360s < ActiveRecord::Migration[5.1]
  def change
    create_table :shop360s do |t|
      t.references :shop, index: true, foreign_key: true
      t.string :view_image
      t.string :json_data
      t.string :url
      t.string :scene_asset_bundle
      t.string :scene_name

      t.timestamps
    end
  end
end
