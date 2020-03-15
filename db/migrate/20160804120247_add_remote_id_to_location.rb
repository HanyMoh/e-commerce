class AddRemoteIdToLocation < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :remote_id, :integer
  end
end
