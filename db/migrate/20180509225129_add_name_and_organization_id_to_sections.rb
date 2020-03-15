class AddNameAndOrganizationIdToSections < ActiveRecord::Migration[5.1]
  def change
    add_column :sections, :name, :string
    add_reference :sections, :organization
  end
end
