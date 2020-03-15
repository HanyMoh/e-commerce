class ChangeReferenceInCartEntryFromProductsToSubProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :cart_entries, :product_id
    add_reference :cart_entries, :sub_product
  end
end
