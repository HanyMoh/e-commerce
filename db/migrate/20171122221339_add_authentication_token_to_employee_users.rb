class AddAuthenticationTokenToEmployeeUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :employee_users, :authentication_token, :string
  end
end
