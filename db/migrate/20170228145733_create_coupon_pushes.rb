class CreateCouponPushes < ActiveRecord::Migration[5.1]
  def change
    create_table :coupon_pushes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :beacon, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
