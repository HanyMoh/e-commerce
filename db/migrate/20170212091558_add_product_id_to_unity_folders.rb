class AddProductIdToUnityFolders < ActiveRecord::Migration[5.1]
  def change
    add_reference :unity_folders, :product, index: true, foreign_key: true
  end
end
