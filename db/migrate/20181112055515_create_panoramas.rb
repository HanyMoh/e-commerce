class CreatePanoramas < ActiveRecord::Migration[5.1]
  def change
    create_table :panoramas do |t|
      t.string :cover
      t.references :panorama_gallery, index: true

      t.timestamps
    end
    add_foreign_key :panoramas, :panorama_galleries
  end
end
