require 'rails_helper'

RSpec.describe 'api/v2/dashboard/stocks/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_stock, Api::V2::Dashboard::Stock.new)
  end

  it 'renders new api/v2/dashboard_stock form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_stocks_path, 'post' do
    end
  end
end
