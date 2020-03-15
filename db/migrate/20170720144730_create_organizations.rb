class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :description
      t.string :type

      t.timestamps null: false
    end
  end
end
