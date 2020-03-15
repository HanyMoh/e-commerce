# == Schema Information
#
# Table name: shop360s
#
#  id                 :bigint(8)        not null, primary key
#  mobile_json_data   :text
#  preview_json_data  :text
#  published          :boolean          default(FALSE)
#  scene_asset_bundle :string
#  scene_name         :string
#  url                :string
#  web_json_data      :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  shop_id            :bigint(8)
#
# Indexes
#
#  index_shop360s_on_shop_id  (shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (shop_id => shops.id)
#

require 'rails_helper'

RSpec.describe Shop360, type: :model do
  before(:all) do
    @shop360 = create(:shop360)
  end

  context 'validations' do
  end

  context 'associations' do
    it { should have_many(:shop_floors).dependent(:destroy) }
    it { should have_many(:sections).dependent(:destroy) }
    it { should belong_to(:shop) }
  end

  it 'is valid with valid attributes' do
    expect(@shop360).to be_valid
  end
end
