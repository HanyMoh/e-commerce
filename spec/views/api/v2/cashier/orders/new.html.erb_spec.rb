require 'rails_helper'

RSpec.describe 'api/v2/cashier/orders/new', type: :view do
  before(:each) do
    assign(:api / v2 / cashier_order, Api::V2::Cashier::Order.new)
  end

  it 'renders new api/v2/cashier_order form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_cashier_orders_path, 'post' do
    end
  end
end
