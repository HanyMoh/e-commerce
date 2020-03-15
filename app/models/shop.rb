class Shop < ApplicationRecord
  serialize :work_times
  before_save :set_parameterized_name
  before_save :set_parameterized_street
  before_save :set_parameterized_area

  mount_uploader :view_image, Image360Uploader
  mount_uploader :logo, ImageUploader
  mount_uploader :banner, ImageUploader

  has_many :sub_products
  has_many :subscribed_users, dependent: :destroy
  has_many :meta_tags, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :employee_users, dependent: :destroy
  has_one :shop360, dependent: :destroy
  has_one :seo_page_title
  has_one :work_time
  belongs_to :brand
  belongs_to :mall, optional: true
  belongs_to :organization, optional: true
  # Deprecated
  belongs_to :building, optional: true

  accepts_nested_attributes_for :work_time

  validates :name, presence: true

  reverse_geocoded_by :lat, :lng

  scope :newest_first, -> { order('created_at desc') }

  def set_parameterized_name
    self.p_name = name.parameterize
  end

  def set_parameterized_street
    self.p_street = street.parameterize
  end

  def set_parameterized_area
    self.p_area = mall_id ? mall.area&.parameterize : area&.parameterize
  end
end
