class AddBeaconsToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :beacons, :integer, array: true
  end
end
