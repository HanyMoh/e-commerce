require 'rails_helper'

RSpec.describe 'api/v2/dashboard/developers/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_developer, Api::V2::Dashboard::Developer.new)
  end

  it 'renders new api/v2/dashboard_developer form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_developers_path, 'post' do
    end
  end
end
