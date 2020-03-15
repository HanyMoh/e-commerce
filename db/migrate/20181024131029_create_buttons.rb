class CreateButtons < ActiveRecord::Migration[5.1]
  def change
    create_table :buttons do |t|
      t.integer :btn_type, default: 1
      t.string :btn_color
      t.string :youtube_link
      t.string :text
      t.string :text_color
      t.references :campaign, index: true
      t.timestamps
    end
    add_foreign_key :buttons, :campaigns 
  end
end
