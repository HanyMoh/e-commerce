class AddDefaultValueForPriceOnSubProducts < ActiveRecord::Migration[5.1]
  def change
    change_column :sub_products, :price, :float, default: 0
  end
end
