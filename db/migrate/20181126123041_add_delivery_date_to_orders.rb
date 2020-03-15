class AddDeliveryDateToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :date_delivery, :datetime
  end
end
