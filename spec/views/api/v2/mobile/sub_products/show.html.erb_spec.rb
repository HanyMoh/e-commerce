require 'rails_helper'

RSpec.describe 'api/v2/mobile/sub_products/show', type: :view do
  before(:each) do
    @api / v2 / mobile_sub_product = assign(:api / v2 / mobile_sub_product, Api::V2::Mobile::SubProduct.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
