require 'rails_helper'

RSpec.describe 'api/v2/dashboard/building_levels/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_building_level, Api::V2::Dashboard::BuildingLevel.new)
  end

  it 'renders new api/v2/dashboard_building_level form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_building_levels_path, 'post' do
    end
  end
end
