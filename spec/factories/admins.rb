# == Schema Information
#
# Table name: admins
#
#  id                     :bigint(8)        not null, primary key
#  avatar                 :string
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  job_title              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  name                   :string
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  seo                    :boolean          default(TRUE)
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_admins_on_email                 (email) UNIQUE
#  index_admins_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryBot.define do
  factory :admin do
    name { Faker::Internet.username }
    job_title ['Backend Developer', 'Scrum Master'].sample
    phone_number { Faker::Base.numerify('010########') }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
