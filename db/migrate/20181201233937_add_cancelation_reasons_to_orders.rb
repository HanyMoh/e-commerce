class AddCancelationReasonsToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :cancelation_reasons, :string,array: true, default: []
  end
end
