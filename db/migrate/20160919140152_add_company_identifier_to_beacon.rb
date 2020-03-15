class AddCompanyIdentifierToBeacon < ActiveRecord::Migration[5.1]
  def change
    add_reference :beacons, :company_identifier, index: true, foreign_key: true
  end
end
