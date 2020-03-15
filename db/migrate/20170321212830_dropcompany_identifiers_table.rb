class DropcompanyIdentifiersTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :beacons, :company_identifier_id
    drop_table :company_identifiers
  end
end
