class RemoveLatitudeAndLongitudeColumsFromShops < ActiveRecord::Migration[5.1]
  def change
    remove_column :shops,:latitude
    remove_column :shops,:longtitude
  end
end
