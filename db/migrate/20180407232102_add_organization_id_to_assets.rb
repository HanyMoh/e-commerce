class AddOrganizationIdToAssets < ActiveRecord::Migration[5.1]
  def change
    add_column :assets, :organization_id, :integer
  end
end
