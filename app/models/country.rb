class Country < ApplicationRecord
  has_many :cities, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
