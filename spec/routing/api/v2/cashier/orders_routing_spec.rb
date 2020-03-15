require 'rails_helper'

RSpec.describe Api::V2::Cashier::OrdersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v2/cashier/orders').to route_to('api/v2/cashier/orders#index')
    end

    it 'routes to #new' do
      expect(get: '/api/v2/cashier/orders/new').to route_to('api/v2/cashier/orders#new')
    end

    it 'routes to #show' do
      expect(get: '/api/v2/cashier/orders/1').to route_to('api/v2/cashier/orders#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/api/v2/cashier/orders/1/edit').to route_to('api/v2/cashier/orders#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v2/cashier/orders').to route_to('api/v2/cashier/orders#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v2/cashier/orders/1').to route_to('api/v2/cashier/orders#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v2/cashier/orders/1').to route_to('api/v2/cashier/orders#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v2/cashier/orders/1').to route_to('api/v2/cashier/orders#destroy', id: '1')
    end
  end
end
