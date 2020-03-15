class CreateCampaignCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :campaign_coupons do |t|
      t.string :name
      t.integer :type
      t.string :hight_screen_image
      t.string :width_screen_image

      t.timestamps
    end
  end
end
