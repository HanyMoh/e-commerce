class AddTutorialForEmployeeUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :employee_users, :tutorial, :boolean, default: true
  end
end
