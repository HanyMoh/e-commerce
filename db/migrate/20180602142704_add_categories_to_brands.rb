class AddCategoriesToBrands < ActiveRecord::Migration[5.1]
  def change
    add_column :brands, :categories, :string, array: true, default: []
  end
end
