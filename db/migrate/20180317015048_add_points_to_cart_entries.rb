class AddPointsToCartEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :cart_entries, :points, :integer
  end
end
