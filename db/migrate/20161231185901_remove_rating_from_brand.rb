class RemoveRatingFromBrand < ActiveRecord::Migration[5.1]
  def change
    remove_column :brands, :rating, :string
  end
end
