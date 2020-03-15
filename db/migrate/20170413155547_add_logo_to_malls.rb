class AddLogoToMalls < ActiveRecord::Migration[5.1]
  def change
    add_column :malls, :logo, :string
    add_column :malls, :description, :text
    add_column :malls, :open_at, :time
    add_column :malls, :close_at, :time
  end
end
