class AddOrganizationIdToSocialLinks < ActiveRecord::Migration[5.1]
  def change
    add_reference :social_links, :organization, index: true, foreign_key: true
  end
end
