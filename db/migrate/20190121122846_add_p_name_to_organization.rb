class AddPNameToOrganization < ActiveRecord::Migration[5.1]
  def change
    add_column :organizations, :p_name, :string
  end
end
