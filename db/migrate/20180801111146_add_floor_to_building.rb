class AddFloorToBuilding < ActiveRecord::Migration[5.1]
  def change
    add_column :buildings, :floor, :integer,default: 0
  end
end
