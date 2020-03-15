class AddSocialsToBrands < ActiveRecord::Migration[5.1]
  def change
    add_column :brands, :facebook, :string
    add_column :brands, :twitter, :string
    add_column :brands, :instagram, :string
  end
end
