class RenameProductsAndStoragesTablesToOlds < ActiveRecord::Migration[5.1]
  def change
    rename_table :products_old, :products_olds
    rename_table :storages_old, :storages_olds
  end
end
