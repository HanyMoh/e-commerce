class CreateBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :brands do |t|
      t.integer :category_id
      t.float :rating
      t.string :name
      t.string :logo
      t.string :short_description
      t.string :long_description
      t.string :website
      t.string :banner_image
      t.string :banner_text_1
      t.string :banner_text_2
      t.string :main_phone_number

      t.timestamps null: false
    end
  end
end
