require 'rails_helper'

RSpec.describe 'api/v2/dashboard/stocks/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_stock = assign(:api / v2 / dashboard_stock, Api::V2::Dashboard::Stock.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
