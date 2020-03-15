require 'rails_helper'

RSpec.describe 'api/v2/dashboard/google_analytics/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_google_analytics, [
             Api::V2::Dashboard::GoogleAnalytic.create!,
             Api::V2::Dashboard::GoogleAnalytic.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/google_analytics' do
    render
  end
end
