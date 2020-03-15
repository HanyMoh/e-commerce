class AddExternalVideoUrlToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :external_video_url, :string
  end
end
