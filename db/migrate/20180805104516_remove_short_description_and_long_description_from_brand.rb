class RemoveShortDescriptionAndLongDescriptionFromBrand < ActiveRecord::Migration[5.1]
  def change
    remove_column :brands,:short_description
    remove_column :brands,:long_description
  end
end
