class CreateProductsForTheNewStructure < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :p_name
      t.string :old_name
      t.string :p_old_name
      t.string :description
      t.string :barcode
      t.string :ean
      t.float :price
      t.float :discount
      t.integer :quantity
      t.string :cover_image
      t.string :temp_image
      t.string :vr_slider, array: true, default: []
      t.boolean :info_updated, default: false
      t.references :brand
      t.references :category
      t.references :organization
      t.timestamps
    end
  end
end
