class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.references :product_line, index: true, foreign_key: true
      t.references :shop, index: true, foreign_key: true
      t.integer :quantity
      t.string :location
      t.decimal :price
      t.decimal :discount
      t.timestamps
    end
  end
end
