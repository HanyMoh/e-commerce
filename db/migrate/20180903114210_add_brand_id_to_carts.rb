class AddBrandIdToCarts < ActiveRecord::Migration[5.1]
  def change
    add_reference :carts, :brand
  end
end
