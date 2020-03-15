class AddImageToSections < ActiveRecord::Migration[5.1]
  def change
    add_column :sections, :image, :string
  end
end
