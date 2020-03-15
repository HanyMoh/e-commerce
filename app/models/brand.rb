class Brand < ApplicationRecord
  include PgSearch
  before_save :set_parameterized_name

  mount_uploader :logo, ImageUploader
  mount_uploader :dark_logo, ImageUploader
  mount_uploader :banner_image, ImageUploader

  multisearchable against: :name
  pg_search_scope :search_by_name, against: :name,
                                   using: {
                                     tsearch: {
                                       prefix: true
                                     }
                                   }

  has_many :shops, dependent: :destroy
  has_many :malls, through: :shops
  has_many :products, dependent: :destroy
  has_many :sub_products, dependent: :destroy
  belongs_to :organization_manager
  belongs_to :category
  belongs_to :organization

  validates :name, :description, :logo, :banner_image, presence: true
  validates :logo, file_size: { less_than: 1024.kilobytes,
                                message: 'logo: should be less than %{count}' },
                   file_content_type: { allow: ['image/jpeg', 'image/png'],
                                        message: 'logo: only %{types} are allowed' }
  validates :banner_image, file_size: { less_than: 1024.kilobytes,
                                        message: 'banner_image: should be less than %{count}' },
                           file_content_type: { allow: ['image/jpeg', 'image/png'],
                                                message: 'banner_image: only %{types} are allowed' }

  scope :newest_first, -> { order('created_at desc') }

  def set_parameterized_name
    self.p_name = name.parameterize
  end

  def self.assigned_shops(brands_ids)
    Shop.where(brand_id: brands_ids)
  end

  def any_websites?
    return 'No websites added' if websites.first.nil? || websites.first.blank?
    websites.first.split(',').join(', ')
  end
end
