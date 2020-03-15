class AddRemoteIdToBeacons < ActiveRecord::Migration[5.1]
  def change
    add_column :beacons, :remote_id, :integer
  end
end
