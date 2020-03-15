class CreateSubProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_products do |t|
      t.references :product
      t.references :shop
      t.string :barcode
      t.float :price
      t.float :discount
      t.string :color
      t.string :size
      t.integer :quantity
      t.string :cover_image
      t.timestamps
    end
  end
end
