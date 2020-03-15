class AddStockManagementToBrands < ActiveRecord::Migration[5.1]
  def change
    add_column :brands, :stock_management, :string, default: "global"
  end
end
