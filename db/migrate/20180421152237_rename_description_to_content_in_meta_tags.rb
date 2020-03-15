class RenameDescriptionToContentInMetaTags < ActiveRecord::Migration[5.1]
  def change
    rename_column :meta_tags, :description, :content
  end
end
