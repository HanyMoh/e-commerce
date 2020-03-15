class AddBannerToShop < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :banner, :string
  end
end
