class AddOrganizationIdToBeacons < ActiveRecord::Migration[5.1]
  def change
    add_reference :beacons, :organization, index: true
  end
end
