class AddCampaignIdToTimeframe < ActiveRecord::Migration[5.1]
  def change
    add_reference :timeframes, :campaign
  end
end
