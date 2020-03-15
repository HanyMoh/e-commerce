class ChangeVrSliderTypeOnStorages < ActiveRecord::Migration[5.1]
  def change
    remove_column :storages, :vr_slider
    add_column :storages, :vr_slider, :string, array: true, default: []
  end
end
