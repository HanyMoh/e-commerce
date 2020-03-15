class AddEanToProductRepositories < ActiveRecord::Migration[5.1]
  def change
    add_column :product_repositories, :ean, :string
  end
end
