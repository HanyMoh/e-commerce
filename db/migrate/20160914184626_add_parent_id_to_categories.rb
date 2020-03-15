class AddParentIdToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :parent_id, :integer
    add_foreign_key :categories, :categories, column: :parent_id, on_delete: :cascade

  end
end
