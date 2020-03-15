require 'rails_helper'

RSpec.describe 'api/v2/navbox/store_carts/index', type: :view do
  before(:each) do
    assign(:api_v2_navbox_store_carts, [
             Api::V2::Navbox::StoreCart.create!,
             Api::V2::Navbox::StoreCart.create!
           ])
  end

  it 'renders a list of api/v2/navbox/store_carts' do
    render
  end
end
