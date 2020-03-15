class AddEanToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :ean, :string
  end
end
