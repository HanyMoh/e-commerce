require 'rails_helper'

RSpec.describe 'api/v2/navbox/store_carts/edit', type: :view do
  before(:each) do
    @api / v2 / navbox_store_cart = assign(:api / v2 / navbox_store_cart, Api::V2::Navbox::StoreCart.create!)
  end

  it 'renders the edit api/v2/navbox_store_cart form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / navbox_store_cart_path(@api / v2 / navbox_store_cart), 'post' do
    end
  end
end
