class CreateScenes < ActiveRecord::Migration[5.1]
  def change
    create_table :scenes do |t|
      t.references :shop_section, index: true, foreign_key: true
      t.references :organization, index: true, foreign_key: true
      t.string :name
      t.attachment :image
      t.timestamps
    end
  end
end
