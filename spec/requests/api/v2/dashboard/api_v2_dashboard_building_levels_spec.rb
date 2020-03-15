require 'rails_helper'

RSpec.describe 'Api::V2::Dashboard::BuildingLevels', type: :request do
  describe 'GET /api_v2_dashboard_building_levels' do
    it 'works! (now write some real specs)' do
      get api_v2_dashboard_building_levels_path
      expect(response).to have_http_status(200)
    end
  end
end
