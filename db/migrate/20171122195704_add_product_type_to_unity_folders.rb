class AddProductTypeToUnityFolders < ActiveRecord::Migration[5.1]
  def change
    add_column :unity_folders, :product_type, :string
    remove_foreign_key :unity_folders, column: 'product_id'
  end
end
