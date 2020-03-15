class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.decimal :price,          precision: 10, scale: 2
      t.references :pocket
      t.references :order
      t.references :shop
      t.references :sub_product
      t.integer :quantity,       default: 1

      t.timestamps
    end
  end
end
