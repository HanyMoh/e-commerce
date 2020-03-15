class CreateUnityFolders < ActiveRecord::Migration[5.1]
  def change
    create_table :unity_folders do |t|
      t.string :name
      t.json :files
      t.timestamps null: false
    end
  end
end
