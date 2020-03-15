require 'rails_helper'

RSpec.describe 'api/v2/dashboard/developers/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_developer = assign(:api / v2 / dashboard_developer, Api::V2::Dashboard::Developer.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
