class AddTimeFromAndToToProductBuyPoints < ActiveRecord::Migration[5.1]
  def change
    add_column :product_buy_points, :date_from, :datetime
    add_column :product_buy_points, :date_to, :datetime
  end
end
