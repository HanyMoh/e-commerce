class RemoveCouponIdFromMediaCoupons < ActiveRecord::Migration[5.1]
  def change
    remove_column :media_coupons, :coupon_id, :foreign_key
  end
end
