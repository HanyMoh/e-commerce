class RemoveCreatedByFormOrgManagers < ActiveRecord::Migration[5.1]
  def change
    remove_column :organization_managers, :created_by
  end
end
