class AddOrganizationIdToShops < ActiveRecord::Migration[5.1]
  def change
    add_reference :shops, :organization, index: true
  end
end
