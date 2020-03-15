class AddDefaultValueForDiscountOnSubProducts < ActiveRecord::Migration[5.1]
  def change
    change_column :sub_products, :discount, :float, default: 0
  end
end
