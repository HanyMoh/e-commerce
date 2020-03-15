class AddPlatformToAppTokens < ActiveRecord::Migration[5.1]
  def change
    add_column :app_tokens, :platform, :integer
  end
end
