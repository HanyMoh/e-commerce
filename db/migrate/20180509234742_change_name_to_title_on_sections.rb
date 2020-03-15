class ChangeNameToTitleOnSections < ActiveRecord::Migration[5.1]
  def change
    rename_column :sections, :name, :title
  end
end
