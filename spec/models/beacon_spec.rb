# == Schema Information
#
# Table name: beacons
#
#  id                :bigint(8)        not null, primary key
#  beacon_type       :string
#  latitude          :integer
#  longitude         :integer
#  major             :integer
#  message_frequency :integer
#  minor             :integer
#  name              :string
#  pos_x             :string
#  pos_y             :string
#  range             :integer
#  status            :boolean          default(FALSE)
#  uuid              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  brand_id          :bigint(8)
#  organization_id   :bigint(8)
#  remote_id         :integer
#  shop_id           :integer
#
# Indexes
#
#  index_beacons_on_brand_id         (brand_id)
#  index_beacons_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id)
#

require 'rails_helper'

RSpec.describe Beacon, type: :model do
  before(:all) do
    @beacon = create(:beacon)
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:message_frequency) }
    it { should validate_presence_of(:shop_id) }
    it {
      should validate_inclusion_of(:message_frequency).in_array([60, 300, 900, 1800, 2700, 3600, 7200, 10_800, 21_600, 43_200, 86_400])
                                                      .with_message('Message Frequency not valid, choose one of '\
                                                                   '[60, 300, 900, 1800, 2700, 3600, 7200, '\
                                                                    '10800, 21600, 43200, 86400]')
    }
    it {
      should validate_inclusion_of(:range).in_array([1, 2, 3])
                                          .with_message(' Range should be one of this value [1, 2 , 3]')
                                          .allow_blank
    }
  end

  context 'associations' do
    it { should have_many(:beacon_tags).dependent(:destroy) }
    it { should have_many(:tags).through(:beacon_tags).dependent(:destroy) }
    it { should have_many(:real_visit_logs) }
    it { should belong_to(:brand).optional }
    it { should belong_to(:organization) }
  end

  it 'is valid with valid attributes' do
    expect(@beacon).to be_valid
  end
end
