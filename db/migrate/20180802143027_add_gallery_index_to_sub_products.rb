class AddGalleryIndexToSubProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :sub_products, :gallery_index, :integer, default: 0
  end
end
