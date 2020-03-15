class AddShopIdToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :shop, index: true
  end
end
