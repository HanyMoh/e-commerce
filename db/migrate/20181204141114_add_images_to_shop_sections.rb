class AddImagesToShopSections < ActiveRecord::Migration[5.1]
  def change
    add_column :shop_sections, :image, :string
  end
end
