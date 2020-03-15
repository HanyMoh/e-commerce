class AddCustomizationColumnsToShopThemes < ActiveRecord::Migration[5.1]
  def change
    add_column :shop_themes, :header_image, :string
    add_column :shop_themes, :footer_image, :string
    add_column :shop_themes, :header_first_color, :string
    add_column :shop_themes, :header_second_color, :string
    add_column :shop_themes, :filter_header_color, :string
    add_column :shop_themes, :filter_text_color, :string
    add_column :shop_themes, :ad_section_color, :string
    add_column :shop_themes, :ad_section_text_color, :string
    add_column :shop_themes, :work_times_icon_color, :string
    add_column :shop_themes, :work_times_text_color, :string
    add_column :shop_themes, :work_days_text_color, :string
  end
end
