class RemoveShopIdFromEmployeeUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :employee_users, :shop_id
  end
end
