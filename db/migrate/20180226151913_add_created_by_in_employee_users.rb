class AddCreatedByInEmployeeUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :employee_users, :created_by, :integer, array: true, default: []
  end
end
