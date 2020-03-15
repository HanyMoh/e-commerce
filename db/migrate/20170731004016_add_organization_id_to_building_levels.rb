class AddOrganizationIdToBuildingLevels < ActiveRecord::Migration[5.1]
  def change
    add_reference :building_levels, :organization, index: true
  end
end
