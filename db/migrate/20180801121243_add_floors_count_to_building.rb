class AddFloorsCountToBuilding < ActiveRecord::Migration[5.1]
  def up
    remove_column :buildings, :floor
    add_column :buildings, :floors_count, :integer, default: 0
  end
  def down
    add_column :buildings, :floor, :integer,default: 0
    remove_column :buildings,:floors_count
  end
end
