class CreateCampaignContentSocialProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :campaign_content_social_profiles do |t|
      t.references :campaign_content, index: true, foreign_key: true
      t.references :social_profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
