class AddOrganizationIdToBrands < ActiveRecord::Migration[5.1]
  def change
    add_reference :brands, :organization, index: true
  end
end
