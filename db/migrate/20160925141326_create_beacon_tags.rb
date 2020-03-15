class CreateBeaconTags < ActiveRecord::Migration[5.1]
  def change
    create_table :beacon_tags do |t|
      t.references :beacon, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
