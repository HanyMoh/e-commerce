class AddOrganizationIdToOrganizationThemes < ActiveRecord::Migration[5.1]
  def change
    add_reference :organization_themes, :organization, index: true, foreign_key: true
  end
end
