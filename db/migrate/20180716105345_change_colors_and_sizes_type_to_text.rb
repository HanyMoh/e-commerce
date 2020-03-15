class ChangeColorsAndSizesTypeToText < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :colors, :text, array: true, default: []
    change_column :product_repositories, :colors, :text, array: true, default: []
    change_column :storages, :colors, :text, array: true, default: []
    change_column :products, :sizes, :text, array: true, default: []
    change_column :product_repositories, :sizes, :text, array: true, default: []
    change_column :storages, :sizes, :text, array: true, default: []
  end
end
