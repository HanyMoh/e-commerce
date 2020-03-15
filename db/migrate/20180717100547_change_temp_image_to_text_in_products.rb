class ChangeTempImageToTextInProducts < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :temp_image, :text
    change_column :product_repositories, :temp_image, :text
  end
end
