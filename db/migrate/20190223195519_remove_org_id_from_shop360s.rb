class RemoveOrgIdFromShop360s < ActiveRecord::Migration[5.1]
  def change
    remove_reference :shop360s, :organization
  end
end
