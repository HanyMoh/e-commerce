class AddOrganizationToFacebookPixles < ActiveRecord::Migration[5.1]
  def change
    add_reference :facebook_pixels, :organization
  end
end
