class SubscribedUser < ApplicationRecord
  belongs_to :shop
  belongs_to :organization

  scope :newest_first, -> { order('created_at desc') }
end
