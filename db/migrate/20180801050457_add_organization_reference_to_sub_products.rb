class AddOrganizationReferenceToSubProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :sub_products, :organization
  end
end
