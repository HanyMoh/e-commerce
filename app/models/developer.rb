class Developer < ApplicationRecord
  validates :name, :password, presence: true
  validates :password, uniqueness: true

  scope :newest_first, -> { order('created_at desc') }
end
