class AddPopupToSubProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :sub_products, :popup, :boolean, default: false
  end
end
