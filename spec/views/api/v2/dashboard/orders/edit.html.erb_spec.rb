require 'rails_helper'

RSpec.describe 'api/v2/dashboard/orders/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_order = assign(:api / v2 / dashboard_order, Api::V2::Dashboard::Order.create!)
  end

  it 'renders the edit api/v2/dashboard_order form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_order_path(@api / v2 / dashboard_order), 'post' do
    end
  end
end
