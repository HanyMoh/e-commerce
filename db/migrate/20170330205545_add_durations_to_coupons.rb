class AddDurationsToCoupons < ActiveRecord::Migration[5.1]
  def change
    add_column :coupons, :duration, :integer
  end
end
