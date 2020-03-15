class AddOrganizationIdToFloor < ActiveRecord::Migration[5.1]
  def change
    add_reference :floors, :organization
  end
end
