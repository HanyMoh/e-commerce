class CreateBeacons < ActiveRecord::Migration[5.1]
  def change
    create_table :beacons do |t|
      t.integer :major
      t.integer :minor
      t.integer :message_frequency
      t.integer :uuid
      t.integer :location_id
      t.integer :latitude
      t.integer :longitude
      t.integer :range
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
