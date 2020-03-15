class AddTimwframToBrand < ActiveRecord::Migration[5.1]
  def change
    add_column :brands, :from, :time
    add_column :brands, :to, :time
  end
end
