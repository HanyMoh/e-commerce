require 'rails_helper'

RSpec.describe 'api/v2/mobile/sub_products/index', type: :view do
  before(:each) do
    assign(:api_v2_mobile_sub_products, [
             Api::V2::Mobile::SubProduct.create!,
             Api::V2::Mobile::SubProduct.create!
           ])
  end

  it 'renders a list of api/v2/mobile/sub_products' do
    render
  end
end
