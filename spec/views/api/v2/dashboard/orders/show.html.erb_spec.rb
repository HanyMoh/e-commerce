require 'rails_helper'

RSpec.describe 'api/v2/dashboard/orders/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_order = assign(:api / v2 / dashboard_order, Api::V2::Dashboard::Order.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
