class AddAndroidFileToAssets < ActiveRecord::Migration[5.1]
  def change
    add_column :assets, :android_file, :string
  end
end
