class AddShopIdToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :shop, index: true
  end
end
