require 'rails_helper'

RSpec.describe 'api/v2/dashboard/organization_themes/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_organization_theme, Api::V2::Dashboard::OrganizationTheme.new)
  end

  it 'renders new api/v2/dashboard_organization_theme form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_organization_themes_path, 'post' do
    end
  end
end
