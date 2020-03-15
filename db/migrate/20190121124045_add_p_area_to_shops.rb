class AddPAreaToShops < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :p_area, :string
  end
end
