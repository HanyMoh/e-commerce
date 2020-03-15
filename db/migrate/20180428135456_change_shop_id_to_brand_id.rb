class ChangeShopIdToBrandId < ActiveRecord::Migration[5.1]
  def change
    remove_column :brand_themes, :shop_id
    add_reference :brand_themes, :brand
  end
end
