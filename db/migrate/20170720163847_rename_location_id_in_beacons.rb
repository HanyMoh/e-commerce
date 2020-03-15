class RenameLocationIdInBeacons < ActiveRecord::Migration[5.1]
  def change
    rename_column :beacons, :location_id, :shop_id
  end
end
