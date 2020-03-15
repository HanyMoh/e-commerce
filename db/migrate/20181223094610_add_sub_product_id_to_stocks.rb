class AddSubProductIdToStocks < ActiveRecord::Migration[5.1]
  def change
    add_reference :stocks, :sub_product, index: true, foreign_key: true
  end
end
