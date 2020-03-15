class RemoveBatteryLevelFromBeacon < ActiveRecord::Migration[5.1]
  def change
  	remove_column :beacons,:battery_level
  end
end
