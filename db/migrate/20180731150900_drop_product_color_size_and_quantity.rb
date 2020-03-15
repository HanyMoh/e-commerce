class DropProductColorSizeAndQuantity < ActiveRecord::Migration[5.1]
  def change
    drop_table :product_colors
    drop_table :product_sizes
    drop_table :product_quantities
  end
end
