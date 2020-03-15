class AddColorsAndSizezToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :colors, :string, array: true, default: []
    add_column :products, :sizes, :string, array: true, default: []
  end
end
