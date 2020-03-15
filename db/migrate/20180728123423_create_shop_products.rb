class CreateShopProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_products do |t|
      t.references :shop
      t.references :product
      t.timestamps
    end
  end
end
