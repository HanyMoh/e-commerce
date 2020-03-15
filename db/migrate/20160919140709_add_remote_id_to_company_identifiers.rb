class AddRemoteIdToCompanyIdentifiers < ActiveRecord::Migration[5.1]
  def change
    add_column :company_identifiers, :remote_id, :integer
  end
end
