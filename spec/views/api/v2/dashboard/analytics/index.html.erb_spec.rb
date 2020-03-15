require 'rails_helper'

RSpec.describe 'api/v2/dashboard/analytics/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_analytics, [
             Api::V2::Dashboard::Analytic.create!,
             Api::V2::Dashboard::Analytic.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/analytics' do
    render
  end
end
