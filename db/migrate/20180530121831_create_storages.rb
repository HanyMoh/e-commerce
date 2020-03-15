class CreateStorages < ActiveRecord::Migration[5.1]
  def change
    create_table :storages do |t|
      t.references :brand
      t.references :category
      t.string :name
      t.text :description
      t.float :price
      t.string :barcode
      t.string :ean
      t.string :cover_image
      t.string :vr_slider
      t.timestamps
    end
  end
end
