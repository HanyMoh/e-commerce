class CreateFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :features do |t|
      t.boolean :cart
      t.boolean :campaign
      t.boolean :beacon
      t.boolean :panorama360
      t.references :organization, index: true

      t.timestamps
    end
    add_foreign_key :features, :organizations
  end
end
