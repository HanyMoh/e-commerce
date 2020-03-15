class Section < ApplicationRecord
  mount_uploader :image, Image360Uploader

  belongs_to :shop360

  validates :title, :image, presence: true

  scope :newest_first, -> { order('created_at desc') }
end
