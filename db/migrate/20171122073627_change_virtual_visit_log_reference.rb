class ChangeVirtualVisitLogReference < ActiveRecord::Migration[5.1]
  def change
    add_column :virtual_visit_logs, :shop_id, :integer
    remove_column :virtual_visit_logs, :brand_id
  end
end
