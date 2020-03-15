class RenameMallsToBuildings < ActiveRecord::Migration[5.1]
  def change
    rename_table :malls, :buildings
  end
end
