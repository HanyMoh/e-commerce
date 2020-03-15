class CreateBrandGenerals < ActiveRecord::Migration[5.1]
  def change
    create_table :brand_generals do |t|
      t.integer :layout,default: 0
      t.string :color
      t.string :white_logo
      t.string :color_logo

      t.timestamps
    end
  end
end
