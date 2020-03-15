class RemoveOrganizationManagerIdFromEmployeeUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :employee_users, :organization_manager_id
  end
end
