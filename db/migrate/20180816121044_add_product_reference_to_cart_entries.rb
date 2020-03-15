class AddProductReferenceToCartEntries < ActiveRecord::Migration[5.1]
  def change
    add_reference :cart_entries, :product
  end
end
