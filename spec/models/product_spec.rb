# == Schema Information
#
# Table name: products
#
#  id              :bigint(8)        not null, primary key
#  barcode         :string
#  colors          :string           default([]), is an Array
#  cover_image     :string
#  description     :string
#  discount        :float
#  ean             :string
#  info_updated    :boolean          default(FALSE)
#  name            :string
#  old_name        :string
#  p_name          :string
#  p_old_name      :string
#  price           :float
#  quantity        :integer
#  sizes           :string           default([]), is an Array
#  temp_image      :string
#  vr_slider       :string           default([]), is an Array
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  brand_id        :bigint(8)
#  category_id     :bigint(8)
#  item_id         :string
#  organization_id :bigint(8)
#
# Indexes
#
#  index_products_on_brand_id         (brand_id)
#  index_products_on_category_id      (category_id)
#  index_products_on_organization_id  (organization_id)
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:all) do
    @product1 = create(:product)
  end

  context 'validations' do
    it { should validate_presence_of(:name).on(:create) }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0.01) }
  end

  context 'associations' do
    it { should have_many(:shop_products).dependent(:destroy) }
    it { should have_many(:shops).through(:shop_products) }
    it { should have_many(:sub_products).dependent(:destroy) }
    it { should have_many(:meta_tags).dependent(:destroy) }
    it { should have_many(:line_items) }
    it { should have_many(:orders).through(:line_items) }
    it { should have_one(:product_buy_point).dependent(:destroy) }
    it { should have_one(:cart_entry) }
    it { should belong_to(:brand) }
    it { should belong_to(:category) }
    it { should belong_to(:organization) }
  end

  it 'is valid with valid attributes' do
    expect(@product1).to be_valid
  end
end
