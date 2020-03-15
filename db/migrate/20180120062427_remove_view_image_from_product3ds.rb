class RemoveViewImageFromProduct3ds < ActiveRecord::Migration[5.1]
  def change
    remove_column :product3ds, :view_image
  end
end
