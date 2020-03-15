class AddOrganizationIdToMetaTags < ActiveRecord::Migration[5.1]
  def change
    add_reference :meta_tags, :organization
  end
end
