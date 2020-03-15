require 'rails_helper'

RSpec.describe 'api/v2/dashboard/google_analytics/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_google_analytic, Api::V2::Dashboard::GoogleAnalytic.new)
  end

  it 'renders new api/v2/dashboard_google_analytic form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_google_analytics_path, 'post' do
    end
  end
end
