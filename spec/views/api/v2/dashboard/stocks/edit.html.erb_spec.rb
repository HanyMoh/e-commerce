require 'rails_helper'

RSpec.describe 'api/v2/dashboard/stocks/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_stock = assign(:api / v2 / dashboard_stock, Api::V2::Dashboard::Stock.create!)
  end

  it 'renders the edit api/v2/dashboard_stock form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_stock_path(@api / v2 / dashboard_stock), 'post' do
    end
  end
end
