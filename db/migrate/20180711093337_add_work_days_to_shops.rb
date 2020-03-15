class AddWorkDaysToShops < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :work_days, :string, array: true, default: []
  end
end
