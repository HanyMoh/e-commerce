class ChangeImageInScenes < ActiveRecord::Migration[5.1]
  def change
    remove_column :scenes, :image_file_name
    remove_column :scenes, :image_content_type
    remove_column :scenes, :image_file_size
    remove_column :scenes, :image_updated_at

    add_column :scenes, :image, :string
  end
end
