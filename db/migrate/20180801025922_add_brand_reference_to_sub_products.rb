class AddBrandReferenceToSubProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :sub_products, :brand
  end
end
