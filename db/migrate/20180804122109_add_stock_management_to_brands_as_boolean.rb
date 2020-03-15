class AddStockManagementToBrandsAsBoolean < ActiveRecord::Migration[5.1]
  def change
    add_column :brands, :stock_management, :boolean, default: true
  end
end
