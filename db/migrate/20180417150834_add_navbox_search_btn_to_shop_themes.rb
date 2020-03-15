class AddNavboxSearchBtnToShopThemes < ActiveRecord::Migration[5.1]
  def change
    add_column :shop_themes, :navbox_search_btn, :string
  end
end
