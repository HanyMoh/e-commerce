class DropProductLines < ActiveRecord::Migration[5.1]
  def change
    drop_table :product_lines
  end
end
