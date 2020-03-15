class CreateBrandThemesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :brand_themes do |t|
      t.references :brand
      t.references :organization
      t.string :logo
      t.string :color
      t.string :slider_header
      t.string :slider_body
      t.string :slider_images, array: true, default: []
      t.boolean :first_section, default: false
      t.integer :first_section_category
      t.string :first_section_image
      t.boolean :second_section, default: false
      t.integer :second_section_category
      t.string :second_section_image
      t.timestamps
    end
  end
end
