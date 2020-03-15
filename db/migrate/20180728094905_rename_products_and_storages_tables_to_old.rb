class RenameProductsAndStoragesTablesToOld < ActiveRecord::Migration[5.1]
  def change
    rename_table :products, :products_old
    rename_table :storages, :storages_old
  end
end
