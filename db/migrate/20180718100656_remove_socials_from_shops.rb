class RemoveSocialsFromShops < ActiveRecord::Migration[5.1]
  def change
    remove_column :shops, :facebook
    remove_column :shops, :twitter
    remove_column :shops, :instagram
  end
end
