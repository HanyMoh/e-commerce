class AddSeoToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :seo, :boolean, :default => true
  end
end
