class AddBannerImageToBrandThemes < ActiveRecord::Migration[5.1]
  def change
    add_column :brand_themes, :banner_image, :string
  end
end
