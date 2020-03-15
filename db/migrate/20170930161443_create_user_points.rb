class CreateUserPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :user_points do |t|
      t.references :organization, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :source, polymorphic: true, index: true
      t.references :brand, index: true, foreign_key: true
      t.integer :points

      t.timestamps null: false
    end
  end
end
