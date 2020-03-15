class CreateGoogleAnalytics < ActiveRecord::Migration[5.1]
  def change
    create_table :google_analytics do |t|
      t.references :organization
      t.references :employee_user
      t.references :shop
      t.string :tracking_id
      t.boolean :general
      t.timestamps
    end
  end
end
