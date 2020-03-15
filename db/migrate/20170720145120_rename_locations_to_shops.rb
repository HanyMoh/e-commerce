class RenameLocationsToShops < ActiveRecord::Migration[5.1]
  def change
    rename_table :locations, :shops
  end
end
