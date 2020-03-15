require 'rails_helper'

RSpec.describe 'api/v2/dashboard/campaigns/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_campaigns, [
             Api::V2::Dashboard::Campaign.create!,
             Api::V2::Dashboard::Campaign.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/campaigns' do
    render
  end
end
