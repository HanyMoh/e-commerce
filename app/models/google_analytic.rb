class GoogleAnalytic < ApplicationRecord
  belongs_to :organization_manager
  belongs_to :shop, optional: true

  validates :tracking_id, presence: true

  scope :newest_first, -> { order('created_at desc') }
end
