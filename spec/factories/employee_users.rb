# == Schema Information
#
# Table name: employee_users
#
#  id                     :bigint(8)        not null, primary key
#  authentication_token   :string
#  avatar                 :string
#  created_by             :integer
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  following_standards    :boolean          default(FALSE)
#  job_title              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  name                   :string
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  seo                    :boolean          default(FALSE)
#  service_type           :integer          default("navbox")
#  sign_in_count          :integer          default(0), not null
#  tutorial               :boolean          default(TRUE)
#  type                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  organization_id        :bigint(8)
#
# Indexes
#
#  index_employee_users_on_email                 (email) UNIQUE
#  index_employee_users_on_organization_id       (organization_id)
#  index_employee_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryBot.define do
  factory :employee_user do
    name { Faker::Internet.username }
    job_title ['Backend Developer', 'Scrum Master'].sample
    phone_number { Faker::Base.numerify('010########') }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/logo.png'), 'image/png') }
    organization
    authentication_token { Faker::String.random(20) }
    seo [true, false].sample
    following_standards [true, false].sample
    service_type %i[navbox marketing both].sample
    tutorial [true, false].sample
  end
end
