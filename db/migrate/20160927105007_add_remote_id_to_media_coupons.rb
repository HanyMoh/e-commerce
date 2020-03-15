class AddRemoteIdToMediaCoupons < ActiveRecord::Migration[5.1]
  def change
    add_column :media_coupons, :remote_id, :integer
  end
end
