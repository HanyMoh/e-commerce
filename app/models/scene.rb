class Scene < ApplicationRecord
  mount_uploader :image, Image360Uploader

  belongs_to :shop_section

  validates :name, :image, presence: true

  default_scope { order(created_at: :asc) }

  scope :newest_first, -> { order('created_at desc') }
end
