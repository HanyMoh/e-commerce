class AddTempImageToStorages < ActiveRecord::Migration[5.1]
  def change
    add_column :storages, :temp_image, :string
  end
end
