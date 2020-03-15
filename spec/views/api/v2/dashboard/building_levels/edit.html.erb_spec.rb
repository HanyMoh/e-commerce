require 'rails_helper'

RSpec.describe 'api/v2/dashboard/building_levels/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_building_level = assign(:api / v2 / dashboard_building_level, Api::V2::Dashboard::BuildingLevel.create!)
  end

  it 'renders the edit api/v2/dashboard_building_level form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_building_level_path(@api / v2 / dashboard_building_level), 'post' do
    end
  end
end
