class AddShopIdAndOrganizationManagerIdToEmployeeUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :employee_users, :shop, index: true
    add_reference :employee_users, :organization_manager, index: true
  end
end
