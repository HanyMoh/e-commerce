class AddProductHoverToShopThemes < ActiveRecord::Migration[5.1]
  def change
    add_column :shop_themes, :product_hover, :string
  end
end
