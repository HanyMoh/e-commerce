class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :news, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :text

      t.timestamps null: false
    end
  end
end
