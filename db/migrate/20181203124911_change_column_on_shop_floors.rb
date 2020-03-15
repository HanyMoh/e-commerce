class ChangeColumnOnShopFloors < ActiveRecord::Migration[5.1]
  def change
    remove_column :shop_floors, :shop_id
    add_reference :shop_floors, :shop360, index: true, foreign_key: true
  end
end
