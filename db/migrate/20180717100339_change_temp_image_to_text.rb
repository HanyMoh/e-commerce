class ChangeTempImageToText < ActiveRecord::Migration[5.1]
  def change
    change_column :storages, :temp_image, :text
  end
end
