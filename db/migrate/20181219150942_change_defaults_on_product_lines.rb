class ChangeDefaultsOnProductLines < ActiveRecord::Migration[5.1]
  def change
    remove_column :product_lines, :barcode
    add_column :product_lines, :barcode, :string, limit: 13
  end
end
