class AddUniqunesIndexToSocialProfiles < ActiveRecord::Migration[5.1]
  def change
    add_index :social_profiles, [:gender, :min_age, :max_age], unique: true
  end
end
