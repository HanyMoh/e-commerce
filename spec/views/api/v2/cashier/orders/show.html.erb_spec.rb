require 'rails_helper'

RSpec.describe 'api/v2/cashier/orders/show', type: :view do
  before(:each) do
    @api / v2 / cashier_order = assign(:api / v2 / cashier_order, Api::V2::Cashier::Order.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
