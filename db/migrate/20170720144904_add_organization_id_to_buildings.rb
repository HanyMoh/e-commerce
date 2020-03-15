class AddOrganizationIdToBuildings < ActiveRecord::Migration[5.1]
  def change
    add_reference :buildings, :organization, index: true
  end
end
