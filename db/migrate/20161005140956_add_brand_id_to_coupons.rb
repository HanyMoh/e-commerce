class AddBrandIdToCoupons < ActiveRecord::Migration[5.1]
  def change
    add_reference :coupons, :brand, index: true, foreign_key: true
  end
end
