# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  address                :string
#  authentication_token   :string           default("")
#  avatar                 :string
#  birth_date             :string
#  city                   :string
#  country                :string
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  firebase_token         :string
#  flat_number            :integer          default(0)
#  gender                 :string
#  image                  :text
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  oauth_expires_at       :datetime
#  oauth_token            :string
#  phone_number           :string
#  post_code              :string
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  uid                    :string
#  user_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_authentication_token  (authentication_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    user_name { Faker::Internet.username }
    password { Faker::Internet.password }
    gender { Faker::Gender.binary_type }
    country { Faker::Address.country }
    city { Faker::Address.city }
    phone_number { Faker::Base.numerify('010########') }
    flat_number { Faker::Base.numerify('#') }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/logo.png'), 'image/png') }
    authentication_token { Faker::String.random(20) }
  end

  factory :google_user do
  end

  factory :facebook_user do
  end
end
