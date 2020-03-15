class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :text
      t.string :text_color
      t.string :text_type
      t.references :campaign, index: true
      t.timestamps
    end
    add_foreign_key :contents, :campaigns
  end
end
