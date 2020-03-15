class CreateBrandManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :brand_managers do |t|
      t.integer :brand_id
      t.integer :manager_id

      t.timestamps null: false
    end
  end
end
