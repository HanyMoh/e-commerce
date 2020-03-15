class AddProductHoverColorsToShopThemes < ActiveRecord::Migration[5.1]
  def change
    add_column :shop_themes, :product_hover_red, :string
    add_column :shop_themes, :product_hover_green, :string
    add_column :shop_themes, :product_hover_blue, :string
  end
end
