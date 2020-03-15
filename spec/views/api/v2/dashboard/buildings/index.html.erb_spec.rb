require 'rails_helper'

RSpec.describe 'api/v2/dashboard/buildings/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_buildings, [
             Api::V2::Dashboard::Building.create!,
             Api::V2::Dashboard::Building.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/buildings' do
    render
  end
end
