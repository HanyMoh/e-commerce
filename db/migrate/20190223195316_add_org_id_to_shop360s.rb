class AddOrgIdToShop360s < ActiveRecord::Migration[5.1]
  def change
    add_reference :shop360s, :organization, index: true, foreign_key: true
  end
end
