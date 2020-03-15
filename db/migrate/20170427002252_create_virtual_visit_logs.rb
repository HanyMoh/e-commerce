class CreateVirtualVisitLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :virtual_visit_logs do |t|
      t.references :brand, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :spent_period
      t.datetime :first_seen
      t.datetime :last_seen
      t.timestamps null: false
    end
  end
end
