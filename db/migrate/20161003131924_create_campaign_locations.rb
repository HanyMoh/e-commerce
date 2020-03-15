class CreateCampaignLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :campaign_locations do |t|
      t.references :campaign, index: true, foreign_key: true
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
