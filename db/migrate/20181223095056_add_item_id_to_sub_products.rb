class AddItemIdToSubProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :sub_products, :item_id, :string
  end
end
