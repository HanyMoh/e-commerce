class AddImagesToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :images, :string, array: true, default: [] # add images column as array
  end
end
