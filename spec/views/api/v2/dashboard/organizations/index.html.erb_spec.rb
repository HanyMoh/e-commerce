require 'rails_helper'

RSpec.describe 'api/v2/dashboard/organizations/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_organizations, [
             Api::V2::Dashboard::Organization.create!,
             Api::V2::Dashboard::Organization.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/organizations' do
    render
  end
end
