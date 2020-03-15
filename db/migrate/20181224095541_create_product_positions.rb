class CreateProductPositions < ActiveRecord::Migration[5.1]
  def change
    create_table :product_positions do |t|
      t.references :shop360, index: true, foreign_key: true
      t.references :organization, index: true, foreign_key: true
      t.text :positions_json_data
      t.timestamps
    end
  end
end
