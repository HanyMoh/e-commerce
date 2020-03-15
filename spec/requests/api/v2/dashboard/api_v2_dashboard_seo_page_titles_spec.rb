require 'rails_helper'

RSpec.describe 'Api::V2::Dashboard::SeoPageTitles', type: :request do
  describe 'GET /api_v2_dashboard_seo_page_titles' do
    it 'works! (now write some real specs)' do
      get api_v2_dashboard_seo_page_titles_path
      expect(response).to have_http_status(200)
    end
  end
end
