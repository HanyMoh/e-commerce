class CreateCheckoutPasswords < ActiveRecord::Migration[5.1]
  def change
    create_table :checkout_passwords do |t|
      t.string :checkout_password
      t.timestamps
    end
  end
end
