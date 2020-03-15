class AddOrganizationIdToShopThemes < ActiveRecord::Migration[5.1]
  def change
    add_column :shop_themes, :organization_id, :integer
  end
end
