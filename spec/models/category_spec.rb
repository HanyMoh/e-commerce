# == Schema Information
#
# Table name: categories
#
#  id         :bigint(8)        not null, primary key
#  logo       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => categories.id) ON DELETE => cascade
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:all) do
    @category = create(:category)
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
  end

  context 'associations' do
    it { should have_many(:sub_categories).class_name('Category').with_foreign_key(:parent_id) }
    it { should have_many(:brands).dependent(:destroy) }
    it { should have_many(:products).dependent(:destroy) }
    it { should belong_to(:parent).class_name('Category').optional }
  end

  context 'nested_attributes' do
    it { should accept_nested_attributes_for(:sub_categories).allow_destroy(true) }
  end

  it 'is valid with valid attributes' do
    expect(@category).to be_valid
  end
end
