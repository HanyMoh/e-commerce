class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_name, :string
    add_column :users, :avatar, :string
    add_column :users, :gender, :string
    add_column :users, :birth_date, :string
  end
end
