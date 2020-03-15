class AddLatitudeAndLongitudeToShop < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :latitude, :float
    add_column :shops, :longtitude, :float
  end
end
