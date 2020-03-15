class DropUnusedTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :sliders
    drop_table :unity_folders
    drop_table :websites
  end
end
