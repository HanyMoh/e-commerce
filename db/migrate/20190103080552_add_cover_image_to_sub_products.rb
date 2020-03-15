class AddCoverImageToSubProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :sub_products, :cover_image, :string
  end
end
