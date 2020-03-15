class DropCartAndLineItems < ActiveRecord::Migration[5.1]
  def change
   if ActiveRecord::Base.connection.data_source_exists? 'line_items' 
    drop_table :line_items 
   end 
   if ActiveRecord::Base.connection.data_source_exists? 'store_carts'
    drop_table :store_carts
   end 
  end
end
