class AddBrandIdToCompanyIdentifiers < ActiveRecord::Migration[5.1]
  def change
    add_column :company_identifiers, :brand_id, :integer
  end
end
