class AddDisplayNameToBrands < ActiveRecord::Migration[5.1]
  def change
    add_column :brands, :display_name, :string
  end
end
