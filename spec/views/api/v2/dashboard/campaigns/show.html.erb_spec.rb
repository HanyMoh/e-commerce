require 'rails_helper'

RSpec.describe 'api/v2/dashboard/campaigns/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_campaign = assign(:api / v2 / dashboard_campaign, Api::V2::Dashboard::Campaign.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
