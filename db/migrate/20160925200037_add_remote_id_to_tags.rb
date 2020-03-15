class AddRemoteIdToTags < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :remote_id, :integer
  end
end
