class CreateSubscribedUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribed_users do |t|
      t.string :email
      t.references :shop, index: true
      t.references :organization, index: true
      t.timestamps
    end
    add_foreign_key :subscribed_users,:shops
    add_foreign_key :subscribed_users,:organizations
  end
end
