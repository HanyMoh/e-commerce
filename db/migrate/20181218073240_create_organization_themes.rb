class CreateOrganizationThemes < ActiveRecord::Migration[5.1]
  def change
    create_table :organization_themes do |t|
      t.string :first_color, default: '#cb0226'
      t.string :second_color, default: '#231f1f'
      t.boolean :first_section, default: false
      t.integer :first_section_product
      t.string :first_section_image
      t.string :logo
      t.boolean :second_section, default: false
      t.integer :second_section_product
      t.string :second_section_image
      t.boolean :slider_body, default: false
      t.string :slider_header
      t.string :slider_images, array: true, default: []
      t.timestamps
    end
  end
end
