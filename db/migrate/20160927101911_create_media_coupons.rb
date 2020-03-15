class CreateMediaCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :media_coupons do |t|
      t.string :name
      t.string :file
      t.string :remote_file_url

      t.timestamps null: false
    end
  end
end
