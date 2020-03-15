class CreateCampaignContents < ActiveRecord::Migration[5.1]
  def change
    create_table :campaign_contents do |t|
      t.references :coupon, index: true, foreign_key: true
      t.string :trigger_name
      t.string :trigger_entity
      t.integer :visit_number
      t.integer :dwell_time
      t.references :tag, index: true, foreign_key: true
      t.integer :remote_id

      t.timestamps null: false
    end
  end
end
