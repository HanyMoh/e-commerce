class CreateNewsLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :news_locations do |t|
      t.integer :news_id
      t.integer :location_id

      t.timestamps null: false
    end
  end
end
