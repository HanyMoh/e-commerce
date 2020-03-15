class AddParameterizedStreetNameToShops < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :p_street, :string
  end
end
