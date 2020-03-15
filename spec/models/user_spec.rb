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

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = create(:user)
  end

  context 'validations' do
    it { should validate_uniqueness_of(:authentication_token) }
    it { should validate_presence_of(:user_name) }
  end

  context 'associations' do
    it { should have_many(:firebase_tokens).dependent(:destroy) }
    it { should have_many(:real_visit_logs) }
    it { should have_many(:virtual_visit_logs) }
    it { should have_many(:user_codes) }
    it { should have_many(:purchase_tokens) }
    it { should have_many(:carts) }
  end

  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end
end
