class AddDarkLogoToBrands < ActiveRecord::Migration[5.1]
  def change
    add_column :brands, :dark_logo, :string
  end
end
