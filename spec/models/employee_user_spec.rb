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

require 'rails_helper'

RSpec.describe EmployeeUser, type: :model do
  before(:all) do
    @employee_user = create(:employee_user)
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:job_title) }
    it { should validate_presence_of(:phone_number) }
    it { should validate_presence_of(:service_type) }
    # it { should validate_uniqueness_of(:phone_number) }
    it { should validate_uniqueness_of(:authentication_token) }
  end

  context 'associations' do
    it { should have_many(:brand_employees).dependent(:destroy) }
    it { should have_many(:assigned_brands).through(:brand_employees).dependent(:destroy) }
    it { should have_many(:role_employee_user).dependent(:destroy) }
    it { should have_many(:roles).through(:role_employee_user) }
    it { should have_many(:scan_logs) }
    it { should belong_to(:organization) }
  end

  it 'is valid with valid attributes' do
    expect(@employee_user).to be_valid
  end
end
