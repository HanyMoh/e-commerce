class CreateBrandCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :brand_categories do |t|
      t.references :brand_theme, foreign_key: true
      t.references :category, foreign_key: true
      t.string :logo

      t.timestamps
    end
  end
end
