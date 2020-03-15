class RemoveNewsIdFromUserFavourites < ActiveRecord::Migration[5.1]
  def change
    remove_reference :user_favourites, :news, index: true, foreign_key: true
  end
end
