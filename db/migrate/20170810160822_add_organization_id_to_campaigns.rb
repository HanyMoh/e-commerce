class AddOrganizationIdToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_reference :campaigns, :organization, index: true
    add_reference :coupons, :organization, index: true
    add_reference :media_coupons, :organization, index: true
    add_reference :social_profiles, :organization, index: true
    add_reference :timeframes, :organization, index: true
  end
end
