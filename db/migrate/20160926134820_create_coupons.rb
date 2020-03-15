class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.string :name
      t.string :description
      t.string :notification_text
      t.string :image
      t.string :content_url
      t.integer :remote_id

      t.timestamps null: false
    end
  end
end
