class RemoveViewImageFromShop360s < ActiveRecord::Migration[5.1]
  def change
    remove_column :shop360s, :view_image
  end
end
