class AddBrandIdToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_reference :campaigns, :brand, index: true, foreign_key: true
  end
end
