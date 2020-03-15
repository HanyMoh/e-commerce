class AddFittingRoomToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :fitting_room, :string
  end
end
