class ChangeColorsAndSizesNameToTemp < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :colors, :temp_colors
    rename_column :product_repositories, :colors, :temp_colors
    rename_column :storages, :colors, :temp_colors
    rename_column :products, :sizes, :temp_sizes
    rename_column :product_repositories, :sizes, :temp_sizes
    rename_column :storages, :sizes, :temo_sizes
  end
end
