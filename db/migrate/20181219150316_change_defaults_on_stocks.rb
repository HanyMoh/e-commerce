class ChangeDefaultsOnStocks < ActiveRecord::Migration[5.1]
  def change
    change_column_default :stocks, :quantity, default: 0
  end
end
