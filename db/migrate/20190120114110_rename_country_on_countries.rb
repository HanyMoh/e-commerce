class RenameCountryOnCountries < ActiveRecord::Migration[5.1]
  def change
    rename_column :countries, :country, :name
  end
end
