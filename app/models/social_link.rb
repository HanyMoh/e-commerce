class SocialLink < ApplicationRecord
  belongs_to :organization

  scope :newest_first, -> { order('created_at desc') }
end
