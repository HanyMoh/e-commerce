class AddBrandIdToBeacons < ActiveRecord::Migration[5.1]
  def change
    add_reference :beacons, :brand, index: true, foreign_key: true
  end
end
