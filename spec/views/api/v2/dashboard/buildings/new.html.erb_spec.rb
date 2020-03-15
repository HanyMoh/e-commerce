require 'rails_helper'

RSpec.describe 'api/v2/dashboard/buildings/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_building, Api::V2::Dashboard::Building.new)
  end

  it 'renders new api/v2/dashboard_building form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_buildings_path, 'post' do
    end
  end
end
