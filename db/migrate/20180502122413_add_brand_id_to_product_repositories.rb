class AddBrandIdToProductRepositories < ActiveRecord::Migration[5.1]
  def change
    add_reference :product_repositories, :brand
  end
end
