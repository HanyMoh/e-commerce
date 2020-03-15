class AddHeaderMiddleFooterLogoToShopThemes < ActiveRecord::Migration[5.1]
  def change
    add_column :shop_themes, :header_logo, :string
    add_column :shop_themes, :middle_logo, :string
    add_column :shop_themes, :footer_logo, :string
  end
end
