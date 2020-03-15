require 'rails_helper'

RSpec.describe 'api/v2/dashboard/campaigns/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_campaign, Api::V2::Dashboard::Campaign.new)
  end

  it 'renders new api/v2/dashboard_campaign form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_campaigns_path, 'post' do
    end
  end
end
