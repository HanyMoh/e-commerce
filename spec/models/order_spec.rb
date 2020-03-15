# == Schema Information
#
# Table name: orders
#
#  id                  :bigint(8)        not null, primary key
#  address             :string(150)
#  cancelation_reasons :string           default([]), is an Array
#  date_delivery       :datetime
#  email               :string(40)
#  name                :string(40)
#  payment_type        :integer          default(0)
#  status              :integer          default("in_progess")
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  organization_id     :bigint(8)
#  user_id             :bigint(8)
#
# Indexes
#
#  index_orders_on_organization_id  (organization_id)
#  index_orders_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  before(:all) do
    @order = create(:order)
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:payment_type) }
  end

  context 'associations' do
    it { should have_many(:line_items).dependent(:destroy) }
    it { should belong_to(:user) }
    it { should belong_to(:organization) }
  end

  it 'is valid with valid attributes' do
    expect(@order).to be_valid
  end
end
