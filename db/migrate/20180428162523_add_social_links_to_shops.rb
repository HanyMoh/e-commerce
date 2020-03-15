class AddSocialLinksToShops < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :facebook, :string
    add_column :shops, :twitter, :string
    add_column :shops, :instagram, :string
  end
end
