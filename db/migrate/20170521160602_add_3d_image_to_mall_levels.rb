class Add3dImageToMallLevels < ActiveRecord::Migration[5.1]
  def change
    add_column :mall_levels, '3d_image', :string
  end
end
