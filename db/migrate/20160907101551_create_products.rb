class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :category, index: true, foreign_key: true
      t.references :brand, index: true, foreign_key: true
      t.float :price
      t.float :discount
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
