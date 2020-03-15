class AddUpdatedOnlineToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :updated_online, :boolean, default: false
  end
end
