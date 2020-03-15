class CreateTimeframes < ActiveRecord::Migration[5.1]
  def change
    create_table :timeframes do |t|
      t.string :name
      t.string :description
      t.string :start_time
      t.string :end_time
      t.string :days
      t.integer :remote_id

      t.timestamps null: false
    end
  end
end
