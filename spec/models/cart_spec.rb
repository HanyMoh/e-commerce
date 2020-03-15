# == Schema Information
#
# Table name: carts
#
#  id         :bigint(8)        not null, primary key
#  active     :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  brand_id   :bigint(8)
#  shop_id    :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_carts_on_brand_id  (brand_id)
#  index_carts_on_shop_id   (shop_id)
#  index_carts_on_user_id   (user_id)
#

require 'rails_helper'

RSpec.describe Cart, type: :model do
  before(:all) do
    @cart = create(:cart)
  end

  context 'validations' do
  end

  context 'associations' do
    it { should have_many(:cart_entries).dependent(:destroy) }
    it { should belong_to(:user) }
    it { should belong_to(:brand) }
    it { should belong_to(:shop).optional }
  end

  it 'is valid with valid attributes' do
    expect(@cart).to be_valid
  end
end
