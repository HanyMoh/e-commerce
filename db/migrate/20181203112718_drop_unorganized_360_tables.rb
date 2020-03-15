class DropUnorganized360Tables < ActiveRecord::Migration[5.1]
  def change
    drop_table :panoramas
    drop_table :panorama_galleries
    drop_table :new_sections
  end
end
