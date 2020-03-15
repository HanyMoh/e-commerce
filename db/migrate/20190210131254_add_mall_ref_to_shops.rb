class AddMallRefToShops < ActiveRecord::Migration[5.1]
  def change
    add_reference :shops, :mall, index: true, foreign_key: true
  end
end
