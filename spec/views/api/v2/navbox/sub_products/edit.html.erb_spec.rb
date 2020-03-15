require 'rails_helper'

RSpec.describe 'api/v2/navbox/sub_products/edit', type: :view do
  before(:each) do
    @api / v2 / navbox_sub_product = assign(:api / v2 / navbox_sub_product, Api::V2::Navbox::SubProduct.create!)
  end

  it 'renders the edit api/v2/navbox_sub_product form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / navbox_sub_product_path(@api / v2 / navbox_sub_product), 'post' do
    end
  end
end
