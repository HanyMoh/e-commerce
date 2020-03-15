class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :address,       limit: 150
      t.string :email,         limit: 40
      t.string :name,          limit: 40
      t.integer :payment_type, default: 0
      t.references :user,      index: true

      t.timestamps
    end
    add_foreign_key :orders, :users
  end
end
