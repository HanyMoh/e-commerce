require 'rails_helper'

RSpec.describe 'Api::V2::Dashboard::MetaTags', type: :request do
  describe 'GET /api_v2_dashboard_meta_tags' do
    it 'works! (now write some real specs)' do
      get api_v2_dashboard_meta_tags_path
      expect(response).to have_http_status(200)
    end
  end
end
