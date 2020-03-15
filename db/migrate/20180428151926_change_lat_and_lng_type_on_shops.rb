class ChangeLatAndLngTypeOnShops < ActiveRecord::Migration[5.1]
  def change
    change_column :shops, :lng, :decimal, {precision: 10, scale: 6}
    change_column :shops, :lat, :decimal, {precision: 10, scale: 6}
  end
end
