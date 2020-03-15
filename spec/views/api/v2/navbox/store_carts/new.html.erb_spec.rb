require 'rails_helper'

RSpec.describe 'api/v2/navbox/store_carts/new', type: :view do
  before(:each) do
    assign(:api / v2 / navbox_store_cart, Api::V2::Navbox::StoreCart.new)
  end

  it 'renders new api/v2/navbox_store_cart form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_navbox_store_carts_path, 'post' do
    end
  end
end
