class CreateProductRedeemPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :product_redeem_points do |t|
      t.integer :points
      t.references :product, index: true, foreign_key: true
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
