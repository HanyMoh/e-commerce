class CreateWebsites < ActiveRecord::Migration[5.1]
  def change
    create_table :websites do |t|
      t.string :url
      t.references :brand

      t.timestamps
    end
  end
end
