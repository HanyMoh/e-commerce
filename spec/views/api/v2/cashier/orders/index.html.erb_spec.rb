require 'rails_helper'

RSpec.describe 'api/v2/cashier/orders/index', type: :view do
  before(:each) do
    assign(:api_v2_cashier_orders, [
             Api::V2::Cashier::Order.create!,
             Api::V2::Cashier::Order.create!
           ])
  end

  it 'renders a list of api/v2/cashier/orders' do
    render
  end
end
