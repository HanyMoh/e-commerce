class CreateCartEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_entries do |t|
      t.references :cart
      t.references :product
      t.timestamps
    end
  end
end
