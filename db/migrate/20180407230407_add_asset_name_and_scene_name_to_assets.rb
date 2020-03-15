class AddAssetNameAndSceneNameToAssets < ActiveRecord::Migration[5.1]
  def change
    add_column :assets, :asset_name, :string
    add_column :assets, :scene_name, :string
  end
end
