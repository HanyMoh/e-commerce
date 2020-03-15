class AddRemoteIdToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :remote_id, :integer
  end
end
