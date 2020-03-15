class AddIndexToShopIdInVirtualVisitLogs < ActiveRecord::Migration[5.1]
  def change
    add_index :virtual_visit_logs, :shop_id
  end
end
