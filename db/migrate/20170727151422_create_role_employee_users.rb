class CreateRoleEmployeeUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :role_employee_users do |t|
      t.integer :employee_user_id
      t.integer :role_id

      t.timestamps null: false
    end
  end
end
