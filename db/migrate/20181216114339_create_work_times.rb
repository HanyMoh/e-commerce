class CreateWorkTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :work_times do |t|
      t.boolean :sat
      t.boolean :sun
      t.boolean :mon
      t.boolean :tue
      t.boolean :wed
      t.boolean :thu
      t.boolean :fri
      t.datetime :opening_at
      t.datetime :closing_at
      t.references :shop, index: true
      t.references :organization, index: true

      t.timestamps
    end

    add_foreign_key :work_times,:shops 
    add_foreign_key :work_times,:organizations
  end
end
