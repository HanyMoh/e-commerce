class AddSocialMediaToActivity < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :social_media, :string
  end
end
