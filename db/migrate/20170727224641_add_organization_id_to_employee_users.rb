class AddOrganizationIdToEmployeeUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :employee_users, :organization, index: true
  end
end
