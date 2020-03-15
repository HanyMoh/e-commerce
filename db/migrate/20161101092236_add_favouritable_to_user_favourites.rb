class AddFavouritableToUserFavourites < ActiveRecord::Migration[5.1]
  def change
    add_column :user_favourites, :favouritable_id, :integer
    add_column :user_favourites, :favouritable_type, :string
    add_index :user_favourites, [:favouritable_type, :favouritable_id]

  end
end
