class AddFollowingStandardsToEmployeeUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :employee_users, :following_standards, :boolean, default: false
  end
end
