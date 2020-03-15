class AddTimeFromAndTimeToToShops < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :time_from, :datetime
    add_column :shops, :time_to, :datetime
  end
end
