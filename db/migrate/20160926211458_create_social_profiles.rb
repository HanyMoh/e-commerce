class CreateSocialProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :social_profiles do |t|
      t.string :gender
      t.integer :min_age
      t.integer :max_age
      t.integer :remote_id

      t.timestamps null: false
    end
  end
end
