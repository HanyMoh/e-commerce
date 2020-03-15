class AddShopIdsToScanLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :scan_logs, :shop_ids, :integer, array: true, default: []
  end
end
