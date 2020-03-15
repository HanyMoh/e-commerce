class CreateProductColors < ActiveRecord::Migration[5.1]
  def change
    create_table :product_colors do |t|
      t.references :product
      t.references :shop
      t.string :color
      t.timestamps
    end
  end
end
