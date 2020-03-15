class AddSeoToEmployeeUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :employee_users, :seo, :boolean, :default => false
  end
end
