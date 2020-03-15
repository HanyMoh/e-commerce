class CreateRedeems < ActiveRecord::Migration[5.1]
  def change
    create_table :redeems do |t|
      t.references :organization, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :brand, index: true, foreign_key: true
      t.integer :points

      t.timestamps null: false
    end
  end
end
