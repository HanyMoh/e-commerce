class RemoveShopRefFromSubProducts < ActiveRecord::Migration[5.1]
  def change
    remove_reference :sub_products, :shop
  end
end
