require 'rails_helper'

RSpec.describe 'api/v2/navbox/store_carts/show', type: :view do
  before(:each) do
    @api / v2 / navbox_store_cart = assign(:api / v2 / navbox_store_cart, Api::V2::Navbox::StoreCart.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
