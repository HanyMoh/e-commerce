class RenameImagesToVrSliderToProducts < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :images, :vr_slider
  end
end
