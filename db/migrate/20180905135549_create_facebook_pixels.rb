class CreateFacebookPixels < ActiveRecord::Migration[5.1]
  def change
    create_table :facebook_pixels do |t|
      t.references :employee_user
      t.references :shop
      t.string :pixel_id
      t.boolean :general, default: false
      t.timestamps
    end
  end
end
