class CreateCampaignContentTimeframes < ActiveRecord::Migration[5.1]
  def change
    create_table :campaign_content_timeframes do |t|
      t.references :campaign_content, index: true, foreign_key: true
      t.references :timeframe, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
