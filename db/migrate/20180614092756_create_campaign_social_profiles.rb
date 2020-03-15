class CreateCampaignSocialProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :campaign_social_profiles do |t|
      t.string :name
      t.boolean :gender
      t.integer :min
      t.integer :max
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
