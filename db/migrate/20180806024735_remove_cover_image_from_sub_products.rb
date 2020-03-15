class RemoveCoverImageFromSubProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :sub_products, :cover_image
  end
end
