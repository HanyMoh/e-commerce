# == Schema Information
#
# Table name: brands
#
#  id                  :bigint(8)        not null, primary key
#  banner_image        :string
#  categories          :string           default([]), is an Array
#  dark_logo           :string
#  description         :string
#  display_name        :string
#  facebook            :string
#  following_standards :boolean          default(FALSE)
#  fri                 :boolean          default(FALSE)
#  from                :time
#  google_plus         :string
#  instagram           :string
#  logo                :string
#  mon                 :boolean          default(FALSE)
#  name                :string
#  p_name              :string
#  phone_numbers       :string           default([]), is an Array
#  pinterest           :string
#  sat                 :boolean          default(FALSE)
#  snapchat            :string
#  stock_management    :boolean          default(TRUE)
#  sun                 :boolean          default(FALSE)
#  thu                 :boolean          default(FALSE)
#  to                  :time
#  tue                 :boolean          default(FALSE)
#  twitter             :string
#  websites            :string           default([]), is an Array
#  wed                 :boolean          default(FALSE)
#  youtube             :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  category_id         :integer
#  organization_id     :bigint(8)
#
# Indexes
#
#  index_brands_on_organization_id  (organization_id)
#

require 'rails_helper'

RSpec.describe Brand, type: :model do
  before(:all) do
    @brand = create(:brand)
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:banner_image) }
    it { should validate_presence_of(:logo) }
  end

  context 'associations' do
    it { should have_many(:shops).dependent(:destroy) }
    it { should have_many(:buildings).through(:shops) }
    it { should have_many(:brand_managers).dependent(:destroy) }
    it { should have_many(:managers).through(:brand_managers).dependent(:destroy) }
    it { should have_many(:brand_employees).dependent(:destroy) }
    it { should have_many(:employee_users).through(:brand_employees).dependent(:destroy) }
    it { should have_many(:products).dependent(:destroy) }
    it { should have_many(:sub_products).dependent(:destroy) }
    it { should have_many(:beacons).dependent(:destroy) }
    it { should have_many(:coupons).dependent(:destroy) }
    it { should have_many(:media_coupons).dependent(:destroy) }
    it { should have_many(:carts).dependent(:destroy) }
    it { should have_one(:brand_theme) }
    it { should belong_to(:category) }
    it { should belong_to(:organization) }
  end

  it 'is valid with valid attributes' do
    expect(@brand).to be_valid
  end
end
