class AddBrandIdToScanLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :scan_logs, :brand_id, :integer
  end
end
