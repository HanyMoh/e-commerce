class CreateMetaTags < ActiveRecord::Migration[5.1]
  def change
    create_table :meta_tags do |t|
      t.references :shop
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
