class CreatePurchaseTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :purchase_tokens do |t|
      t.references :user, index: true, foreign_key: true
      t.datetime :valid_until
      t.string :token

      t.timestamps null: false
    end
  end
end
