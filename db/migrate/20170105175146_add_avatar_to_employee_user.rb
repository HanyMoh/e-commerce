class AddAvatarToEmployeeUser < ActiveRecord::Migration[5.1]
  def change
    add_column :employee_users, :avatar, :string
  end
end
