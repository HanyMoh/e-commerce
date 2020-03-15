class EmployeeUser < ApplicationRecord
  enum service_type: %i[navbox marketing both]
  before_create :generate_authentication_token!

  mount_base64_uploader :avatar, ImageUploader

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable, :recoverable
  # :registerable, :confirmable, :rememberable, :trackable, :validatable

  has_many :role_employee_user, dependent: :destroy
  has_many :roles, through: :role_employee_user
  has_one :power
  belongs_to :organization
  belongs_to :shop, optional: true
  belongs_to :organization_manager, optional: true

  validates :name, :job_title, :phone_number, :service_type, presence: true
  validates :phone_number, uniqueness: true
  validates :authentication_token, uniqueness: true
  validates :avatar, file_size: { less_than: 1024.kilobytes,
                                  message: '%{attribute}: should be less than %{count}' },
                     file_content_type: { allow: ['image/jpeg', 'image/png'],
                                          message: '%{attribute}: only %{types} are allowed' }
  validates :phone_number, numericality: { only_integer: true,
                                           message: '%{attribute} must be a number' }

  accepts_nested_attributes_for :power

  scope :newest_first, -> { order(created_at: :desc) }

  def generate_authentication_token!
    self.authentication_token = Devise.friendly_token
  end
end
