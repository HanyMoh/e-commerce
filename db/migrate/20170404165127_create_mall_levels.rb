class CreateMallLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :mall_levels do |t|
      t.integer :level
      t.integer :mall_id
      t.string :image
      t.decimal :image_longitude, {precision: 10, scale: 6}
      t.decimal :image_latitude, {precision: 10, scale: 6}
      t.text :corridors, null: false, default: '[]'
      t.text :gates, null: false, default: '[]'
      t.text :beacons, null: false, default: '[]'

      t.timestamps null: false
    end
  end
end
