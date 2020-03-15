require 'rails_helper'

RSpec.describe 'api/v2/dashboard/stocks/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_stocks, [
             Api::V2::Dashboard::Stock.create!,
             Api::V2::Dashboard::Stock.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/stocks' do
    render
  end
end
