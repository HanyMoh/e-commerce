class AddQuantityToCartEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :cart_entries, :quantity, :integer
  end
end
