require 'rails_helper'

RSpec.describe 'Api::V2::Cashier::Orders', type: :request do
  describe 'GET /api_v2_cashier_orders' do
    it 'works! (now write some real specs)' do
      get api_v2_cashier_orders_path
      expect(response).to have_http_status(200)
    end
  end
end
