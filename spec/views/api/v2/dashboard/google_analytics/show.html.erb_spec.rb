require 'rails_helper'

RSpec.describe 'api/v2/dashboard/google_analytics/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_google_analytic = assign(:api / v2 / dashboard_google_analytic, Api::V2::Dashboard::GoogleAnalytic.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
