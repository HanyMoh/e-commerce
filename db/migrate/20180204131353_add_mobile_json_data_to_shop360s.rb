class AddMobileJsonDataToShop360s < ActiveRecord::Migration[5.1]
  def change
    add_column :shop360s, :mobile_json_data, :string
  end
end
