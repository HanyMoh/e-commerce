class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :type
      t.string :title
      t.string :url
      t.string :description
      t.string :image
      t.integer :brand_id

      t.timestamps null: false
    end
  end
end
