require 'rails_helper'

RSpec.describe 'api/v2/dashboard/organization_themes/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_organization_theme = assign(:api / v2 / dashboard_organization_theme, Api::V2::Dashboard::OrganizationTheme.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
