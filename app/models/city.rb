class City < ApplicationRecord
  has_many :malls, dependent: :destroy # Confirmed
  belongs_to :country

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false, scope: :country }
end
