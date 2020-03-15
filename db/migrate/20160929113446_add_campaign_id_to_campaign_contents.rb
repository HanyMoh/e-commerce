class AddCampaignIdToCampaignContents < ActiveRecord::Migration[5.1]
  def change
    add_reference :campaign_contents, :campaign, index: true, foreign_key: true
  end
end
