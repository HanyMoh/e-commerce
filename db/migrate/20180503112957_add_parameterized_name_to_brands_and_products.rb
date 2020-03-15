class AddParameterizedNameToBrandsAndProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :brands, :p_name, :string
    add_column :products, :p_name, :string
  end
end
