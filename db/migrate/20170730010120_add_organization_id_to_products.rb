class AddOrganizationIdToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :organization, index: true
  end
end
