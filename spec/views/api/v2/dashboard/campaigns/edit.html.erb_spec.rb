require 'rails_helper'

RSpec.describe 'api/v2/dashboard/campaigns/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_campaign = assign(:api / v2 / dashboard_campaign, Api::V2::Dashboard::Campaign.create!)
  end

  it 'renders the edit api/v2/dashboard_campaign form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_campaign_path(@api / v2 / dashboard_campaign), 'post' do
    end
  end
end
