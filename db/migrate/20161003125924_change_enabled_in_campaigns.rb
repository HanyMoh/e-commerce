class ChangeEnabledInCampaigns < ActiveRecord::Migration[5.1]
  def change
  change_column :campaigns, :enabled, :boolean, :default => false
  end
end
