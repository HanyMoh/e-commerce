class CreateSeoPageTitles < ActiveRecord::Migration[5.1]
  def change
    create_table :seo_page_titles do |t|
      t.references :organization
      t.references :shop
      t.string :title
      t.timestamps
    end
  end
end
