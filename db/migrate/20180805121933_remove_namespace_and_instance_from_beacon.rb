class RemoveNamespaceAndInstanceFromBeacon < ActiveRecord::Migration[5.1]
  def change
    remove_column :beacons, :namespace
    remove_column :beacons, :instance
  end
end
