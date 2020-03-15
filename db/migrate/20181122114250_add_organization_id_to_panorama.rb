class AddOrganizationIdToPanorama < ActiveRecord::Migration[5.1]
  def change
    add_reference :panoramas, :organization
  end
end
