require 'rails_helper'

RSpec.describe 'Api::V2::Dashboard::Organizations', type: :request do
  describe 'GET /api_v2_dashboard_organizations' do
    it 'works! (now write some real specs)' do
      get api_v2_dashboard_organizations_path
      expect(response).to have_http_status(200)
    end
  end
end
