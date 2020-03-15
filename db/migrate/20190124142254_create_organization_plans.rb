class CreateOrganizationPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :organization_plans do |t|
      t.string :country
      t.integer :stores_count
      t.decimal :price
      t.references :organization, index: true

      t.timestamps
    end
  end
end
