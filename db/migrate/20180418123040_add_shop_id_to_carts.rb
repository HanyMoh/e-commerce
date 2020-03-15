class AddShopIdToCarts < ActiveRecord::Migration[5.1]
  def change
    add_reference :carts, :shop, index: true
  end
end
