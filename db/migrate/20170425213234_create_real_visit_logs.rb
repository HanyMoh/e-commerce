class CreateRealVisitLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :real_visit_logs do |t|
      t.integer :user_id
      t.integer :beacon_id
      t.datetime :first_seen
      t.datetime :last_seen
      t.integer :spent_period
      t.timestamps null: false
    end
  end
end
