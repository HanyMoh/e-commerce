class FixNameErrorInColorsAndSizesColumnNames < ActiveRecord::Migration[5.1]
  def change
    rename_column :storages, :temo_sizes, :temp_sizes
  end
end
