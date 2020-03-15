class AddOrganizationManagerIdToBrandManager < ActiveRecord::Migration[5.1]
  def change
    add_reference :brand_managers, :organization_manager, index: true
  end
end
