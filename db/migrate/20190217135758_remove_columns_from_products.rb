class RemoveColumnsFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :old_name
    remove_column :products, :p_old_name
    remove_column :products, :barcode
    remove_column :products, :ean
    remove_column :products, :price
    remove_column :products, :discount
    remove_column :products, :quantity
    remove_column :products, :temp_image
    remove_column :products, :vr_slider
    remove_column :products, :colors
    remove_column :products, :sizes
  end
end
