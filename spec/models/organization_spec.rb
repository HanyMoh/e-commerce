# == Schema Information
#
# Table name: organizations
#
#  id          :bigint(8)        not null, primary key
#  description :string
#  name        :string
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Organization, type: :model do
  before(:all) do
    @organization = create(:organization)
  end

  context 'validations' do
    it { should validate_uniqueness_of(:name) }
  end

  context 'associations' do
    it { should have_many(:brands) }
    it { should have_many(:buildings) }
    it { should have_many(:shops).through(:brands) }
    it { should have_many(:roles) }
  end

  it 'is valid with valid attributes' do
    expect(@organization).to be_valid
  end
end
