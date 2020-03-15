class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable, :recoverable
  # :registerable, :confirmable, :trackable

  mount_base64_uploader :avatar, ImageUploader

  before_create :generate_authentication_token!

  validates :name, :job_title, :phone_number, presence: true
  validates :phone_number, uniqueness: true
  validates :phone_number, numericality: { only_integer: true,
                                           message: '%{attribute} must be a number' }
  validates :avatar, file_size: { less_than: 1024.kilobytes,
                                  message: '%{attribute}: should be less than %{count}' },
                     file_content_type: { allow: ['image/jpeg', 'image/png'],
                                          message: '%{attribute}: only %{types} are allowed' }

  scope :newest_first, -> { order('created_at desc') }

  def generate_authentication_token!
    self.authentication_token = Devise.friendly_token
  end
end
