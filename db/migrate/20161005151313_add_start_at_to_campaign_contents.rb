class AddStartAtToCampaignContents < ActiveRecord::Migration[5.1]
  def change
    add_column :campaign_contents, :start_at, :datetime
  end
end
