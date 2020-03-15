class CreateShopThemes < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_themes do |t|
      t.references :shop
    end
  end
end
