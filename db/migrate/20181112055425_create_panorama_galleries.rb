class CreatePanoramaGalleries < ActiveRecord::Migration[5.1]
  def change
    create_table :panorama_galleries do |t|
      t.references :category, index: true
      t.references :shop, index: true
      t.references :new_section, index: true

      t.timestamps
    end
    add_foreign_key :panorama_galleries, :categories
    add_foreign_key :panorama_galleries, :shops
    add_foreign_key :panorama_galleries, :new_sections
  end
end
