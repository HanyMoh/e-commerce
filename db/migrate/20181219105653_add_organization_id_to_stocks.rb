class AddOrganizationIdToStocks < ActiveRecord::Migration[5.1]
  def change
    add_reference :stocks, :organization
  end
end
