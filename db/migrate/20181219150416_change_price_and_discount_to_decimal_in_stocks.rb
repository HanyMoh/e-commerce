class ChangePriceAndDiscountToDecimalInStocks < ActiveRecord::Migration[5.1]
  def change
    remove_column :stocks, :price
    remove_column :stocks, :discount
    add_column :stocks, :price, :decimal, precision: 10, scale: 2, default: 0
    add_column :stocks, :discount, :decimal, precision: 10, scale: 2, default: 0
  end
end
