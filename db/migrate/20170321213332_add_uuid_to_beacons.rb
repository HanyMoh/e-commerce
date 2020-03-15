class AddUuidToBeacons < ActiveRecord::Migration[5.1]
  def change
    remove_column :beacons, :uuid
    add_column :beacons, :uuid, :string
  end
end
