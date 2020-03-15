class AddSocialNetworksToBrand < ActiveRecord::Migration[5.1]
  def change
    add_column :brands, :pinterest, :string
    add_column :brands, :youtube, :string
    add_column :brands, :snapchat, :string
    add_column :brands, :google_plus, :string
  end
end
