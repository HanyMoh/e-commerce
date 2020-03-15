class AddEquippedToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :equipped, :boolean, default: false
  end
end
