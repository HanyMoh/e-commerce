class AddNumberToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :number, :integer
  end
end
