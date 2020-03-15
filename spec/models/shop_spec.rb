# == Schema Information
#
# Table name: shops
#
#  id              :bigint(8)        not null, primary key
#  address         :string
#  banner          :string
#  city            :string
#  country         :string
#  enable_logo     :boolean          default(TRUE)
#  floor           :string
#  lat             :decimal(10, 6)
#  lng             :decimal(10, 6)
#  logo            :string
#  name            :string
#  p_street        :string
#  phone_number    :string
#  street          :string
#  street_number   :string
#  time_from       :datetime
#  time_to         :datetime
#  view_image      :string
#  work_days       :string           default([]), is an Array
#  work_times      :text
#  zip             :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  brand_id        :integer
#  building_id     :integer
#  organization_id :bigint(8)
#  remote_id       :integer
#
# Indexes
#
#  index_shops_on_organization_id  (organization_id)
#

require 'rails_helper'

RSpec.describe Shop, type: :model do
  before(:all) do
    @shop = create(:shop)
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
  end

  context 'associations' do
    it { should have_many(:campaigns).dependent(:destroy) }
    it { should have_many(:virtual_visit_logs) }
    it { should have_many(:beacons).dependent(:destroy) }
    it { should have_many(:shop_products).dependent(:destroy) }
    it { should have_many(:products).through(:shop_products) }
    it { should have_many(:sub_products) }
    it { should have_many(:subscribed_users).dependent(:destroy) }
    it { should have_many(:carts).dependent(:destroy) }
    it { should have_many(:meta_tags).dependent(:destroy) }
    it { should have_one(:shop360).dependent(:destroy) }
    it { should have_one(:seo_page_title) }
    it { should belong_to(:brand) }
    it { should belong_to(:building).optional }
    it { should belong_to(:organization).optional }
  end

  it 'is valid with valid attributes' do
    expect(@shop).to be_valid
  end
end
