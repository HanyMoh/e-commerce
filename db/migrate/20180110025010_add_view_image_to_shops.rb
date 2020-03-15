class AddViewImageToShops < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :view_image, :string
  end
end
