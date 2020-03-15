class AddNamespaceAndInstanceToBeacons < ActiveRecord::Migration[5.1]
  def change
    add_column :beacons, :namespace, :string
    add_column :beacons, :instance, :string
  end
end
