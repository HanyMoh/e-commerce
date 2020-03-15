class AddTempImageToProductRepos < ActiveRecord::Migration[5.1]
  def change
    add_column :product_repositories, :temp_image, :string
  end
end
