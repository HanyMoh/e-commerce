class DropColorsAndSizes < ActiveRecord::Migration[5.1]
  def change
    drop_table :colors
    drop_table :sizes
  end
end
