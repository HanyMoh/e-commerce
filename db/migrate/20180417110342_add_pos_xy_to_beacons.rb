class AddPosXyToBeacons < ActiveRecord::Migration[5.1]
  def change
    add_column :beacons, :pos_x, :string
    add_column :beacons, :pos_y, :string
  end
end
