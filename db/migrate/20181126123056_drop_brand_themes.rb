class DropBrandThemes < ActiveRecord::Migration[5.1]
  def change
    drop_table :brand_themes
  end
end
