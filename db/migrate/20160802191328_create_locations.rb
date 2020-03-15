class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :country
      t.string :city
      t.string :zip
      t.string :street
      t.string :street_number
      t.string :floor
      t.string :phone_number
      t.integer :brand_id
      t.float :lat
      t.float :lng

      t.timestamps null: false
    end
  end
end
