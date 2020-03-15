class AddWorkTimesToShops < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :work_times, :text
  end
end
