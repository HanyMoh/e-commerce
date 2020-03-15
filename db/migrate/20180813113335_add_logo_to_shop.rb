class AddLogoToShop < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :logo, :string
    add_column :shops, :enable_logo, :boolean, default: true
  end
end
