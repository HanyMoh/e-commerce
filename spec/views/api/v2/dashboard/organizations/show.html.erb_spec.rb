require 'rails_helper'

RSpec.describe 'api/v2/dashboard/organizations/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_organization = assign(:api / v2 / dashboard_organization, Api::V2::Dashboard::Organization.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
