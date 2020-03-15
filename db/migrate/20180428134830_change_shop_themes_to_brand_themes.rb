class ChangeShopThemesToBrandThemes < ActiveRecord::Migration[5.1]
  def change
    rename_table :shop_themes, :brand_themes
  end
end
