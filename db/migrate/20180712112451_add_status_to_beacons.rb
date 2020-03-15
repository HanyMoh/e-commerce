class AddStatusToBeacons < ActiveRecord::Migration[5.1]
  def change
    add_column :beacons, :status, :boolean,default: false
  end
end
