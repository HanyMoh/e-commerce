class CreateSliders < ActiveRecord::Migration[5.1]
  def change
    create_table :sliders do |t|
      t.string :images, :string, array: true, default: [] # add images column as array
      t.timestamps null: false
    end
  end
end
