class CreateProductLines < ActiveRecord::Migration[5.1]
  def change
    create_table :product_lines do |t|
      t.string :item_id
      t.references :product, index: true, foreign_key: true
      t.references :organization, index: true, foreign_key: true
      t.string :barcode
      t.string :size
      t.string :color
      t.string :cover_image
      t.timestamps
    end
  end
end
