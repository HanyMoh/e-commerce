class AddAreaToBuildings < ActiveRecord::Migration[5.1]
  def change
    add_column :buildings, :area, :string
  end
end
