require 'rails_helper'

RSpec.describe 'api/v2/navbox/orders/new', type: :view do
  before(:each) do
    assign(:api / v2 / navbox_order, Api::V2::Navbox::Order.new)
  end

  it 'renders new api/v2/navbox_order form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_navbox_orders_path, 'post' do
    end
  end
end
