class AddTypeToEmployeeUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :employee_users, :type, :string
  end
end
