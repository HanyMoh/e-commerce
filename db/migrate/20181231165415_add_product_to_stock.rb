class AddProductToStock < ActiveRecord::Migration[5.1]
  def change
    add_reference :stocks, :product, index: true, foreign_key: true
    remove_column :stocks, :product_line_id, :integer
  end
end
