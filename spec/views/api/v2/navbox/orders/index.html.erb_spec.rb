require 'rails_helper'

RSpec.describe 'api/v2/navbox/orders/index', type: :view do
  before(:each) do
    assign(:api_v2_navbox_orders, [
             Api::V2::Navbox::Order.create!,
             Api::V2::Navbox::Order.create!
           ])
  end

  it 'renders a list of api/v2/navbox/orders' do
    render
  end
end
