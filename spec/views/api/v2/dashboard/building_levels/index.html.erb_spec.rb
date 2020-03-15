require 'rails_helper'

RSpec.describe 'api/v2/dashboard/building_levels/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_building_levels, [
             Api::V2::Dashboard::BuildingLevel.create!,
             Api::V2::Dashboard::BuildingLevel.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/building_levels' do
    render
  end
end
