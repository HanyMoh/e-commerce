class ChangeStockManagementDefaultValueInBrands < ActiveRecord::Migration[5.1]
  def change
    remove_column :brands, :stock_management
  end
end
