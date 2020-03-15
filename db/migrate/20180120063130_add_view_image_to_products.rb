class AddViewImageToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :view_image, :string
  end
end
