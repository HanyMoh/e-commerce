class AddBrandIdToMediaCoupons < ActiveRecord::Migration[5.1]
  def change
    add_reference :media_coupons, :brand, index: true, foreign_key: true
  end
end
