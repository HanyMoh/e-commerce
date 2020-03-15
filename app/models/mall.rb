class Mall < ApplicationRecord
  before_save :set_parameterized_names

  has_many :shops
  belongs_to :city

  validates :name, presence: true
  validates :area, presence: true
  validates :name, uniqueness: { case_sensitive: false, scope: :city }

  def set_parameterized_names
    self.p_area = area.parameterize
  end
end
