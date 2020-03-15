class CreatePowers < ActiveRecord::Migration[5.1]
  def change
    create_table :powers do |t|
      t.boolean :money_redeem, default: false
      t.boolean :product_redeem, default: false
      t.boolean :navbox_scan, default: false
      t.boolean :clients_profile, default: false
      t.boolean :branch_analytics, default: false
      t.boolean :create_campaign, default: false
      t.boolean :branch_storage, default: false
      t.boolean :home_delivery, default: false
      t.references :organization, index: true
      t.references :employee_user, index: true

      t.timestamps
    end
  end
end
