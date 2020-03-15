class AddAreaToShops < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :area, :string
  end
end
