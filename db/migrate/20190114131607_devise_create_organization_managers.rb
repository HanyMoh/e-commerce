# frozen_string_literal: true

class DeviseCreateOrganizationManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :organization_managers do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
      t.string :name
      t.string :email
      t.string :avatar 
      t.string :job_title
      t.string :authentication_token
      t.boolean :seo, default: false 
      t.boolean :following_standards, default: false 
      t.boolean :tutorial, default: false  
      t.integer :service_type, default: 0
      t.references :organization
      t.string :phone_number
      t.timestamps null: false
    end

    add_index :organization_managers, :email,                unique: true
    add_index :organization_managers, :reset_password_token, unique: true
    add_foreign_key :organization_managers, :organizations
    # add_index :organization_managers, :confirmation_token,   unique: true
    # add_index :organization_managers, :unlock_token,         unique: true
  end
end
