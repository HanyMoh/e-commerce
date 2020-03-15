class CreateProductRepositories < ActiveRecord::Migration[5.1]
  def change
    create_table :product_repositories do |t|
      t.references :category, index: true, foreign_key: true
      t.decimal :price
      t.string :name
      t.text :description
      t.string :cover_image
      t.string :vr_slider
      t.string :fitting_room
      t.string :barcode

      t.timestamps null: false
    end
  end
end
