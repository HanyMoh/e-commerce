class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :enabled

      t.timestamps null: false
    end
  end
end
