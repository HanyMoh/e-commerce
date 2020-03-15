require 'rails_helper'

RSpec.describe 'api/v2/navbox/sub_products/index', type: :view do
  before(:each) do
    assign(:api_v2_navbox_sub_products, [
             Api::V2::Navbox::SubProduct.create!,
             Api::V2::Navbox::SubProduct.create!
           ])
  end

  it 'renders a list of api/v2/navbox/sub_products' do
    render
  end
end
