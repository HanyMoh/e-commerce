require 'rails_helper'

RSpec.describe 'Api::V2::Dashboard::Features', type: :request do
  describe 'GET /api_v2_dashboard_features' do
    it 'works! (now write some real specs)' do
      get api_v2_dashboard_features_path
      expect(response).to have_http_status(200)
    end
  end
end
