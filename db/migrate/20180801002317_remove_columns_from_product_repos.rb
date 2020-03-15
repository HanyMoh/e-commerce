class RemoveColumnsFromProductRepos < ActiveRecord::Migration[5.1]
  def change
    remove_column :product_repositories, :vr_slider
    remove_column :product_repositories, :ean
    remove_column :product_repositories, :brand_id
    remove_column :product_repositories, :temp_colors
    remove_column :product_repositories, :temp_sizes
    remove_column :product_repositories, :category_id
    change_column :product_repositories, :price, :float, default: 0
    remove_column :product_repositories, :fitting_room
  end
end
