class AddProductToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :product_type, :integer
    add_column :campaigns, :product_img, :string
    add_column :campaigns, :product_name, :string
    add_column :campaigns, :product_txt_color, :string
    add_column :campaigns, :product_txt_type, :string
    add_column :campaigns, :product_price, :float
    add_column :campaigns, :product_price_txt_color, :string
    add_column :campaigns, :product_price_txt_type, :string
    add_column :campaigns, :product_circle_color, :string
  end
end
