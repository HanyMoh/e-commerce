class AddVideoToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :video, :string
  end
end
