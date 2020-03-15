class AddColumsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address, :string
    add_column :users, :country, :string
    add_column :users, :city, :string
    add_column :users, :phone_number, :string
    add_column :users, :post_code, :string
    add_column :users, :flat_number, :integer, default: 0
  end
end
