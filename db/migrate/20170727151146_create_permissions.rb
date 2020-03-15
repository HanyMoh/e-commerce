class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.string :target_model_name
      t.string :action

      t.timestamps null: false
    end
  end
end
