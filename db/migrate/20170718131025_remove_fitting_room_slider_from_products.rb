class RemoveFittingRoomSliderFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :fitting_room_slider, :string, array: true, default: []
  end
end
