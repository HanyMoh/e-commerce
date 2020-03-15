class AddGalleryToSubProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :sub_products, :gallery, :string, array: true, default: []
  end
end
