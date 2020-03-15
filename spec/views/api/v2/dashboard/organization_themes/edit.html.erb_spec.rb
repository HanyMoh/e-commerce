require 'rails_helper'

RSpec.describe 'api/v2/dashboard/organization_themes/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_organization_theme = assign(:api / v2 / dashboard_organization_theme, Api::V2::Dashboard::OrganizationTheme.create!)
  end

  it 'renders the edit api/v2/dashboard_organization_theme form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_organization_theme_path(@api / v2 / dashboard_organization_theme), 'post' do
    end
  end
end
