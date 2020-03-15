class CreateMallsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :malls do |t|
      t.references :city, index: true, foreign_key: true
      t.string :name
      t.string :area
      t.string :p_area
      t.string :address
      t.timestamps
    end
  end
end
