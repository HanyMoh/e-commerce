require 'rails_helper'

RSpec.describe 'api/v2/cashier/orders/edit', type: :view do
  before(:each) do
    @api / v2 / cashier_order = assign(:api / v2 / cashier_order, Api::V2::Cashier::Order.create!)
  end

  it 'renders the edit api/v2/cashier_order form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / cashier_order_path(@api / v2 / cashier_order), 'post' do
    end
  end
end
