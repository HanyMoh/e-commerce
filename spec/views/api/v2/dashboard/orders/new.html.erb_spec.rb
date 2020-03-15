require 'rails_helper'

RSpec.describe 'api/v2/dashboard/orders/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_order, Api::V2::Dashboard::Order.new)
  end

  it 'renders new api/v2/dashboard_order form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_orders_path, 'post' do
    end
  end
end
