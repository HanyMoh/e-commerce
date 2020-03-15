class CreateEmployeeUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_users do |t|
      t.string :name
      t.string :email
      t.string :job_title
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
