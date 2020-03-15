class AddWeekDaysToBrand < ActiveRecord::Migration[5.1]
  def change
    add_column :brands, :sat, :boolean, default: false
    add_column :brands, :sun, :boolean, default: false
    add_column :brands, :mon, :boolean, default: false
    add_column :brands, :tue, :boolean, default: false
    add_column :brands, :wed, :boolean, default: false
    add_column :brands, :thu, :boolean, default: false
    add_column :brands, :fri, :boolean, default: false
  end
end
