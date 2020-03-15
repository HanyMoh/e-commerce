class AddColumnToBrandCategory < ActiveRecord::Migration[5.1]
  def change
    remove_column :brand_categories,:brand_theme_id
    add_reference :brand_categories, :brand_general, foreign_key: true
  end
end
