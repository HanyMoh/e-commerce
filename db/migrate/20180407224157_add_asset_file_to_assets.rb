class AddAssetFileToAssets < ActiveRecord::Migration[5.1]
  def change
    add_column :assets, :asset_file, :string
  end
end
