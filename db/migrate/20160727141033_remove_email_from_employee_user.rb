class RemoveEmailFromEmployeeUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :employee_users, :email, :string
  end
end
