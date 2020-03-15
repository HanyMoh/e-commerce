class AddMallIdToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :mall_id, :integer
  end
end
