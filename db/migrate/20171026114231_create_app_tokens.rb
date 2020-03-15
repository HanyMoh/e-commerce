class CreateAppTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :app_tokens do |t|
      t.boolean :active, default: true
      t.string :token, null: false
      t.string :title

      t.timestamps null: false
    end
    add_index :app_tokens, :token, unique: true
  end
end
