class CreateBrandCovers < ActiveRecord::Migration[5.1]
  def change
    create_table :brand_covers do |t|
      t.string :cover
      t.references :brand_general,foreign_key: true
      t.string :name
      t.boolean :selected,default: false

      t.timestamps
    end
  end
end
