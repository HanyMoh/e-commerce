require 'rails_helper'

RSpec.describe 'api/v2/dashboard/orders/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_orders, [
             Api::V2::Dashboard::Order.create!,
             Api::V2::Dashboard::Order.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/orders' do
    render
  end
end
