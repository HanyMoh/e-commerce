class CreateBrandEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :brand_employees do |t|
      t.integer :brand_id
      t.integer :employee_user_id

      t.timestamps null: false
    end
  end
end
