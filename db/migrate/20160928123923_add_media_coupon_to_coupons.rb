class AddMediaCouponToCoupons < ActiveRecord::Migration[5.1]
  def change
    add_reference :coupons, :media_coupon, index: true, foreign_key: true
  end
end
