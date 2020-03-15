class AddItemIdToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :item_id, :string
  end
end
