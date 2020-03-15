class AddShopIdToEmployeeUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :employee_users, :shop, index: true
  end
end
