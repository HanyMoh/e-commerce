class CreatePermissionRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :permission_roles do |t|
      t.integer :permission_id
      t.integer :role_id

      t.timestamps null: false
    end
  end
end
