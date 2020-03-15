require 'rails_helper'

RSpec.describe 'api/v2/dashboard/organization_themes/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_organization_themes, [
             Api::V2::Dashboard::OrganizationTheme.create!,
             Api::V2::Dashboard::OrganizationTheme.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/organization_themes' do
    render
  end
end
