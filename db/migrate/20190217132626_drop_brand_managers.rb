class DropBrandManagers < ActiveRecord::Migration[5.1]
  def change
    drop_table :brand_managers
  end
end
