class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.references :shop360
      t.text :web_json_data
      t.text :mobile_json_data
      t.timestamps
    end
  end
end
