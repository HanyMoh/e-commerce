class ChangePriceTypeInStocks < ActiveRecord::Migration[5.1]
  def change
    remove_column :stocks, :price
    remove_column :stocks, :discount
    add_column :stocks, :price, :float, default: 0
    add_column :stocks, :discount, :float, default: 0
  end
end
