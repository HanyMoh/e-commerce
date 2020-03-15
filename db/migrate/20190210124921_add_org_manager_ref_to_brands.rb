class AddOrgManagerRefToBrands < ActiveRecord::Migration[5.1]
  def change
    add_reference :brands, :organization_manager, index: true, foreign_key: true
  end
end
