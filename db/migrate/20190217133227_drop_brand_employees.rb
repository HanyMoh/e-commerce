class DropBrandEmployees < ActiveRecord::Migration[5.1]
  def change
    drop_table :brand_employees
  end
end
