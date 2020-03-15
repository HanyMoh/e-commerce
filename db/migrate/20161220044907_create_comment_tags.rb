class CreateCommentTags < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_tags do |t|
      t.references :comment, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
