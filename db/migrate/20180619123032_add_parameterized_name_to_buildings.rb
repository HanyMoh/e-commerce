class AddParameterizedNameToBuildings < ActiveRecord::Migration[5.1]
  def change
    add_column :buildings, :p_name, :string
  end
end
