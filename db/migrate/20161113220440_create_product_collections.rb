class CreateProductCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :product_collections do |t|
      t.references :product, index: true, foreign_key: true
      t.references :collection, index: true, foreign_key: true
      t.integer :order

      t.timestamps null: false
    end
  end
end
