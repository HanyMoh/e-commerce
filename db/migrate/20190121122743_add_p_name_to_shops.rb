class AddPNameToShops < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :p_name, :string
  end
end
