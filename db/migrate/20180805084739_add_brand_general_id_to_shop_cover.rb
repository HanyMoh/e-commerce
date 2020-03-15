class AddBrandGeneralIdToShopCover < ActiveRecord::Migration[5.1]
  def change
    add_reference :shop_covers, :brand_general, foreign_key: true
  end
end
