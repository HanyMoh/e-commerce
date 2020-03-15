require 'rails_helper'

RSpec.describe 'api/v2/dashboard/organizations/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_organization = assign(:api / v2 / dashboard_organization, Api::V2::Dashboard::Organization.create!)
  end

  it 'renders the edit api/v2/dashboard_organization form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_organization_path(@api / v2 / dashboard_organization), 'post' do
    end
  end
end
