class OrganizationManager < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  enum service_type: %i[navbox marketing both]
  before_create :generate_authentication_token!

  mount_base64_uploader :avatar, ImageUploader
  has_many :employee_users, dependent: :destroy 
  has_many :facebook_pixels, dependent: :destroy 
  has_many :google_analytics, dependent: :destroy 
  has_many :brands, dependent: :destroy
  belongs_to :organization

  validates :name, :job_title, :phone_number, :service_type, presence: true
  validates :phone_number, uniqueness: true
  validates :authentication_token, uniqueness: true
  validates :avatar, file_size: { less_than: 1024.kilobytes,
                                  message: '%{attribute}: should be less than %{count}' },
                     file_content_type: { allow: ['image/jpeg', 'image/png'],
                                          message: '%{attribute}: only %{types} are allowed' }
  validates :phone_number, numericality: { only_integer: true,
                                           message: '%{attribute} must be a number' }

  scope :newest_first, -> { order('created_at desc') }

  def generate_authentication_token!
    self.authentication_token = Devise.friendly_token
  end
end
