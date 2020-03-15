require 'rails_helper'

RSpec.describe 'api/v2/dashboard/building_levels/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_building_level = assign(:api / v2 / dashboard_building_level, Api::V2::Dashboard::BuildingLevel.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
