class AddBackgroundToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :bg_type, :integer
    add_column :campaigns, :bg_img, :string
    add_column :campaigns, :bg_left_color, :string
    add_column :campaigns, :bg_right_color, :string
    add_column :campaigns, :bg_color, :string
  end
end
