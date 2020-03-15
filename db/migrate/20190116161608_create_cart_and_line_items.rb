class CreateCartAndLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :store_carts do |t|

      t.timestamps
    end
    add_reference :store_carts, :user, index: true, foreign_key: true
    
    create_table :line_items do |t|
      t.references :product,     index: true
      t.decimal :price,          precision: 10, scale: 2
      t.integer :quantity,       default: 1
      t.references :store_cart,  index: true
      t.references :order,       index: true

      t.timestamps
    end
    add_foreign_key :line_items, :products
    add_foreign_key :line_items, :store_carts
    add_foreign_key :line_items, :orders
  end
end
