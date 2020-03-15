class ConvertWebsitesToArray < ActiveRecord::Migration[5.1]
  def change
    remove_column :brands,:website,:string
    add_column :brands,:websites,:string,array: true,default: []
  end
end
