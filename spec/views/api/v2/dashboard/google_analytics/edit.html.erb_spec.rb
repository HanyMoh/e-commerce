require 'rails_helper'

RSpec.describe 'api/v2/dashboard/google_analytics/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_google_analytic = assign(:api / v2 / dashboard_google_analytic, Api::V2::Dashboard::GoogleAnalytic.create!)
  end

  it 'renders the edit api/v2/dashboard_google_analytic form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_google_analytic_path(@api / v2 / dashboard_google_analytic), 'post' do
    end
  end
end
