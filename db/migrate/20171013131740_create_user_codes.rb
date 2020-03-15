class CreateUserCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :user_codes do |t|
      t.references :user, index: true, foreign_key: true
      t.string :code
      t.boolean :used, default: false

      t.timestamps null: false
    end
    add_index :user_codes, :code, unique: true
  end
end
