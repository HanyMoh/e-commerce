class AddBatteryLevelToBeacons < ActiveRecord::Migration[5.1]
  def change
    add_column :beacons, :battery_level, :float, null: false, default: 100
  end
end
