class User < ApplicationRecord
  include PgSearch
  acts_as_token_authenticatable
  mount_base64_uploader :avatar, ImageUploader
  before_create :generate_authentication_token!

  multisearchable against: :user_name
  pg_search_scope :search_by_name, against: :user_name,
                                   using: { tsearch: { prefix: true } }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pockets

  validates :authentication_token, uniqueness: true
  validates :user_name, presence: true
  validates :avatar, file_size: { less_than: 1024.kilobytes,
                                  message: 'avatar: should be less than %{count}' },
                     file_content_type: { allow: ['image/jpeg', 'image/png'],
                                          message: 'avatar: only %{types} are allowed' }

  scope :newest_first, -> { order('created_at desc') }

  def generate_authentication_token!
    while self.class.exists?(authentication_token: authentication_token)
      self.authentication_token = Devise.friendly_token
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth, platform)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email || "#{user.uid}@nasnav.com" # auth.info.email
      if platform == 'api'
        user.user_name = auth.user_name # auth.user_name
        user.image = auth.info.image
      else
        user.user_name = auth.extra.raw_info.name # auth.user_name
        user.image = auth.info.image
      end
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
