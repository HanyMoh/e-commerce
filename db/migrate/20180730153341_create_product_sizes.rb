class CreateProductSizes < ActiveRecord::Migration[5.1]
  def change
    create_table :product_sizes do |t|
      t.references :product
      t.references :shop
      t.string :size
      t.timestamps
    end
  end
end
