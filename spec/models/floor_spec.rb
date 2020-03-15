# == Schema Information
#
# Table name: floors
#
#  id              :bigint(8)        not null, primary key
#  angle           :float
#  floor_number    :integer
#  lat             :float
#  logo            :string
#  long            :float
#  name            :string
#  opacity         :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  building_id     :bigint(8)
#  organization_id :bigint(8)
#
# Indexes
#
#  index_floors_on_building_id      (building_id)
#  index_floors_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (building_id => buildings.id)
#

require 'rails_helper'

RSpec.describe Floor, type: :model do
  before(:all) do
    # @floor = create(:floor)
  end

  context 'validations' do
  end

  context 'associations' do
    # it { should belong_to(:building).counter_cache(true) }
    # it { should belong_to(:organization) }
  end

  it 'is valid with valid attributes' do
    # expect(@floor).to be_valid
  end
end
