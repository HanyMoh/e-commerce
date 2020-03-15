require 'rails_helper'

RSpec.describe Api::V2::Dashboard::OrdersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v2/dashboard/orders').to route_to('api/v2/dashboard/orders#index')
    end

    it 'routes to #new' do
      expect(get: '/api/v2/dashboard/orders/new').to route_to('api/v2/dashboard/orders#new')
    end

    it 'routes to #show' do
      expect(get: '/api/v2/dashboard/orders/1').to route_to('api/v2/dashboard/orders#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/api/v2/dashboard/orders/1/edit').to route_to('api/v2/dashboard/orders#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v2/dashboard/orders').to route_to('api/v2/dashboard/orders#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v2/dashboard/orders/1').to route_to('api/v2/dashboard/orders#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v2/dashboard/orders/1').to route_to('api/v2/dashboard/orders#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v2/dashboard/orders/1').to route_to('api/v2/dashboard/orders#destroy', id: '1')
    end
  end
end
