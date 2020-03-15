class CreateUserFavourites < ActiveRecord::Migration[5.1]
  def change
    create_table :user_favourites do |t|
      t.references :user, index: true, foreign_key: true
      t.references :news, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
