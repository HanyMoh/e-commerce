class AddOrganizationIdToShopFloors < ActiveRecord::Migration[5.1]
  def change
    add_reference :shop_floors, :organization, index: true, foreign_key: true
  end
end
