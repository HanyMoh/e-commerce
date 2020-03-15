class RemoveImageFromCoupons < ActiveRecord::Migration[5.1]
  def change
    remove_column :coupons, :image, :string
  end
end
