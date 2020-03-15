# == Schema Information
#
# Table name: product_repositories
#
#  id          :bigint(8)        not null, primary key
#  barcode     :string
#  cover_image :string
#  description :text
#  name        :string
#  price       :float            default(0.0)
#  temp_image  :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe ProductRepository, type: :model do
  before(:all) do
    @product_repository = create(:product_repository)
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:barcode) }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  end

  context 'associations' do
  end

  it 'is valid with valid attributes' do
    expect(@product_repository).to be_valid
  end
end
