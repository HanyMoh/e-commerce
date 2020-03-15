class AddBrandThemeToBrandGeneral < ActiveRecord::Migration[5.1]
  def change
    add_reference :brand_generals, :brand_theme, foreign_key: true
  end
end
