# == Schema Information
#
# Table name: campaigns
#
#  id                      :bigint(8)        not null, primary key
#  beacons                 :integer          is an Array
#  bg_color                :string
#  bg_img                  :string
#  bg_left_color           :string
#  bg_right_color          :string
#  bg_type                 :integer
#  description             :string
#  enabled                 :boolean          default(FALSE)
#  end_time                :datetime
#  header_color            :string
#  header_txt              :string
#  header_txt_color        :string
#  header_txt_type         :string
#  header_type             :integer          default("round_shape")
#  name                    :string
#  product_circle_color    :string
#  product_img             :string
#  product_name            :string
#  product_price           :float
#  product_price_txt_color :string
#  product_price_txt_type  :string
#  product_txt_color       :string
#  product_txt_type        :string
#  product_type            :integer
#  start_time              :datetime
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  brand_id                :bigint(8)
#  organization_id         :bigint(8)
#  remote_id               :integer
#  shop_id                 :bigint(8)
#
# Indexes
#
#  index_campaigns_on_brand_id         (brand_id)
#  index_campaigns_on_organization_id  (organization_id)
#  index_campaigns_on_shop_id          (shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (shop_id => shops.id)
#

require 'rails_helper'

RSpec.describe Campaign, type: :model do
  before(:all) do
    @campaign = create(:campaign)
  end

  context 'validations' do
  end

  context 'associations' do
    it { should have_many(:buttons).dependent(:destroy) }
    it { should have_many(:contents).dependent(:destroy) }
    it { should have_one(:campaign_coupon).dependent(:destroy) }
    it { should have_one(:timeframe).dependent(:destroy) }
    it { should have_one(:campaign_social_profile).dependent(:destroy) }
    it { should belong_to(:shop) }
    it { should belong_to(:organization) }
  end

  context 'nested_attributes' do
    it { should accept_nested_attributes_for(:timeframe) }
    it { should accept_nested_attributes_for(:campaign_coupon) }
    it { should accept_nested_attributes_for(:campaign_social_profile) }
    it { should accept_nested_attributes_for(:buttons) }
    it { should accept_nested_attributes_for(:contents) }
  end

  it 'is valid with valid attributes' do
    expect(@campaign).to be_valid
  end
end
