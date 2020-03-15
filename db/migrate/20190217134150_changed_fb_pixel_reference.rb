class ChangedFbPixelReference < ActiveRecord::Migration[5.1]
  def change
    remove_reference :facebook_pixels, :employee_user
    add_reference :facebook_pixels, :organization_manager, index: true, foreign_key: true
  end
end
