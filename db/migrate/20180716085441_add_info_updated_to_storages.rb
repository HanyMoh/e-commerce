class AddInfoUpdatedToStorages < ActiveRecord::Migration[5.1]
  def change
    add_column :storages, :info_updated, :boolean, default: false
  end
end
