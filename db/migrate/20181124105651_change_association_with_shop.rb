class ChangeAssociationWithShop < ActiveRecord::Migration[5.1]
  def change
    remove_column :panorama_galleries,:shop_id,:integer 
    add_reference :panorama_galleries,:shop360, index: true
    add_foreign_key :panorama_galleries,:shop360s
  end
end
