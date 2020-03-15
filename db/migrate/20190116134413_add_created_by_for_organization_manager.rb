class AddCreatedByForOrganizationManager < ActiveRecord::Migration[5.1]
  def change
    add_column :organization_managers, :created_by, :integer, array: true, default: []
  end
end
