class AddTempPhotoToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :temp_photo, :string
  end
end
