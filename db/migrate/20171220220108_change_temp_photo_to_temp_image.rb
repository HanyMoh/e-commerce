class ChangeTempPhotoToTempImage < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :temp_photo, :temp_image
  end
end
