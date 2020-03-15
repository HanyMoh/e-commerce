class AddFollowingStandardsToBrands < ActiveRecord::Migration[5.1]
  def change
    add_column :brands, :following_standards, :boolean, default: false
  end
end
