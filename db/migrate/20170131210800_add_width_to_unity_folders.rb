class AddWidthToUnityFolders < ActiveRecord::Migration[5.1]
  def change
    add_column :unity_folders, :width, :string
  end
end
