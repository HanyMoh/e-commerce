class AddLogoToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :logo, :string
  end
end
