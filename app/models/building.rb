class Building < ApplicationRecord
  include PgSearch
  before_save :add_parameterized_name

  mount_uploader :logo, ImageUploader
  mount_uploader :banner, ImageUploader

  multisearchable against: %i[name address]
  pg_search_scope :search_by_name, against: :name,
                                   using: { tsearch: { prefix: true } }

  TYPES = %w[Mall Hospital Other]

  has_many :shops
  has_many :brands, through: :shops
  belongs_to :organization

  validates :name, uniqueness: { case_sensitive: false }
  validates :building_type, inclusion: TYPES
  validates :area, presence: true

  scope :newest_first, -> { order(created_at: :desc) }

  def add_parameterized_name
    self.p_name = name.parameterize
  end
end
