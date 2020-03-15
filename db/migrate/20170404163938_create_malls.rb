class CreateMalls < ActiveRecord::Migration[5.1]
  def change
    create_table :malls do |t|
      t.string :name
      t.text :address
      t.decimal :longitude, {precision: 10, scale: 6}
      t.decimal :latitude, {precision: 10, scale: 6}

      t.timestamps null: false
    end
  end
end
