class DropSocialProfiles < ActiveRecord::Migration[5.1]
  def change
    drop_table :social_profiles
  end
end
