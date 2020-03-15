class CreateShopCovers < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_covers do |t|
      t.references :shop, foreign_key: true
      # t.references :brand_general_cover, foreign_key: true

      t.timestamps
    end
  end
end
