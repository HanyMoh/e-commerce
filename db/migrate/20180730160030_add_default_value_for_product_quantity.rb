class AddDefaultValueForProductQuantity < ActiveRecord::Migration[5.1]
  def change
    change_column :product_quantities, :quantity, :integer, default: 0
  end
end
