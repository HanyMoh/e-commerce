require 'rails_helper'

RSpec.describe 'Api::V2::Navbox::StoreCarts', type: :request do
  describe 'GET /api_v2_navbox_store_carts' do
    it 'works! (now write some real specs)' do
      get api_v2_navbox_store_carts_path
      expect(response).to have_http_status(200)
    end
  end
end
