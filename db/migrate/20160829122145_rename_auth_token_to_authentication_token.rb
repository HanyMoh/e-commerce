class RenameAuthTokenToAuthenticationToken < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :auth_token, :authentication_token
  end
end
