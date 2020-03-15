require 'rails_helper'

RSpec.describe 'api/v2/dashboard/organizations/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_organization, Api::V2::Dashboard::Organization.new)
  end

  it 'renders new api/v2/dashboard_organization form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_organizations_path, 'post' do
    end
  end
end
