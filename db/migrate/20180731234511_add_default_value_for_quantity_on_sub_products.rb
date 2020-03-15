class AddDefaultValueForQuantityOnSubProducts < ActiveRecord::Migration[5.1]
  def change
    change_column :sub_products, :quantity, :integer, default: 0
  end
end
