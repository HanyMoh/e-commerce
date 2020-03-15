class AddOrganizationIdToStorages < ActiveRecord::Migration[5.1]
  def change
    add_reference :storages, :organization
  end
end
