class CreateFirebaseTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :firebase_tokens do |t|
      
      t.text :token
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
