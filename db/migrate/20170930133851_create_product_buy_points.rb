class CreateProductBuyPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :product_buy_points do |t|
      t.references :product, index: true, foreign_key: true
      t.integer :points
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
