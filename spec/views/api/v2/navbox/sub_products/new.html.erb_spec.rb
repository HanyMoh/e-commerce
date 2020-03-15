require 'rails_helper'

RSpec.describe 'api/v2/navbox/sub_products/new', type: :view do
  before(:each) do
    assign(:api / v2 / navbox_sub_product, Api::V2::Navbox::SubProduct.new)
  end

  it 'renders new api/v2/navbox_sub_product form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_navbox_sub_products_path, 'post' do
    end
  end
end
