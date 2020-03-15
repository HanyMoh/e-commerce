class DeleteBrandGeneralCoverTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :shop_covers
    # drop_table :brand_general_covers
  end
end
