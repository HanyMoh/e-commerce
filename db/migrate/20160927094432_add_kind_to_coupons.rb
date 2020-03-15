class AddKindToCoupons < ActiveRecord::Migration[5.1]
  def change
    add_column :coupons, :kind, :string
  end
end
