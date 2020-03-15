require 'rails_helper'

RSpec.describe 'api/v2/dashboard/analytics/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_analytic, Api::V2::Dashboard::Analytic.new)
  end

  it 'renders new api/v2/dashboard_analytic form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_analytics_path, 'post' do
    end
  end
end
