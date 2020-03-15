class ChangeCreatedByTypeInEmployeeUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :employee_users, :created_by
  end
end
