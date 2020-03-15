class AddColumnsToFloor < ActiveRecord::Migration[5.1]
  def change
    add_column :floors, :name, :string
    add_column :floors, :floor_number, :integer
    add_column :floors, :lat, :float
    add_column :floors, :long, :float
    add_column :floors, :angle, :float
    add_column :floors, :opacity, :float
  end
end
