class CopyFittingRoomData < ActiveRecord::Migration[5.1]
  def up
    Product.all.each do |product|
      unless product.fitting_room_slider.empty?
        image_path = Rails.root.join"public/uploads/#{Product.to_s.underscore}/fitting_room_slider/#{product.id}/#{product.fitting_room_slider[0]}"
        product.update_attributes(fitting_room: image_path.open)
      end
    end
  end
  def down
    Product.all.each do |product|
      if product.fitting_room.present?
        image_path = Rails.root.join"public/uploads/#{Product.to_s.underscore}/fitting_room/#{product.id}/#{product.fitting_room}"
        product.update_attributes(fitting_room_slider: [image_path.open])
      end
    end
  end
end
