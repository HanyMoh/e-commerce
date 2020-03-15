class AddHeaderToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :header_type, :integer,default: 0
    add_column :campaigns, :header_color, :string
    add_column :campaigns, :header_txt, :string
    add_column :campaigns, :header_txt_color, :string
    add_column :campaigns, :header_txt_type, :string
  end
end
