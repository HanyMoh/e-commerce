class AddFittingRoomSliderToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :fitting_room_slider, :string, array: true, default: []
  end
end
