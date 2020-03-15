class ChangeCategoryIdToNullableInProductsRepository < ActiveRecord::Migration[5.1]
  def change
    change_column :product_repositories, :category_id, :integer, :null => true
  end
end
