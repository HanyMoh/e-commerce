class CreateFellowships < ActiveRecord::Migration[5.1]
  def change
    create_table :fellowships do |t|
      t.references :user, index: true, null: false
      t.references :followee, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :fellowships, :users, column: :user_id
    add_foreign_key :fellowships, :users, column: :followee_id
  end
end
