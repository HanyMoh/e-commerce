class AddServiceTypeForEmployeeUser < ActiveRecord::Migration[5.1]
  def change
    add_column :employee_users,:service_type,:integer,default: 0
  end
end
