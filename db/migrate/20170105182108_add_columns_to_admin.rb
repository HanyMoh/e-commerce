class AddColumnsToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :name, :string
    add_column :admins, :job_title, :string
    add_column :admins, :phone_number, :string
    add_column :admins, :avatar, :string
  end
end
