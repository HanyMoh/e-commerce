class DropCheckoutPasswordsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :checkout_passwords
  end
end
