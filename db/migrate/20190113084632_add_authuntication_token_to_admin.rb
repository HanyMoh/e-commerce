class AddAuthunticationTokenToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :authentication_token, :string
  end
end
