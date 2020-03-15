class SeoPageTitle < ApplicationRecord
  belongs_to :organization
  belongs_to :shop

  validates :title, presence: true

  scope :newest_first, -> { order('created_at desc') }
end
