class AddOrgIdToTags < ActiveRecord::Migration[5.1]
  def change
    add_reference :tags, :organization, foreign_key: true, index: true
  end
end
