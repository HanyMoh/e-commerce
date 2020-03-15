class CreateBrandThemes < ActiveRecord::Migration[5.1]
  def change
    create_table :brand_themes do |t|
      t.references :brand
      t.references :organization
      t.string :header_logo
      t.string :footer_logo
      t.string :main_color
      t.timestamps
    end
  end
end
