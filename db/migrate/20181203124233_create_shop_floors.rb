class CreateShopFloors < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_floors do |t|
      t.references :shop, index: true, foreign_key: true
      t.integer :number
      t.string :name
      t.timestamps
    end
  end
end
