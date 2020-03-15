class AddColorAndSizeToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :colors, :string, array: true, default: []
    add_column :product_repositories, :colors, :string, array: true, default: []
    add_column :storages, :colors, :string, array: true, default: []
    add_column :products, :sizes, :string, array: true, default: []
    add_column :product_repositories, :sizes, :string, array: true, default: []
    add_column :storages, :sizes, :string, array: true, default: []
  end
end
