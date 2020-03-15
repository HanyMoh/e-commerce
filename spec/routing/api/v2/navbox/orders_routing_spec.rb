require 'rails_helper'

RSpec.describe Api::V2::Navbox::OrdersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v2/navbox/orders').to route_to('api/v2/navbox/orders#index')
    end

    it 'routes to #new' do
      expect(get: '/api/v2/navbox/orders/new').to route_to('api/v2/navbox/orders#new')
    end

    it 'routes to #show' do
      expect(get: '/api/v2/navbox/orders/1').to route_to('api/v2/navbox/orders#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/api/v2/navbox/orders/1/edit').to route_to('api/v2/navbox/orders#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v2/navbox/orders').to route_to('api/v2/navbox/orders#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v2/navbox/orders/1').to route_to('api/v2/navbox/orders#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v2/navbox/orders/1').to route_to('api/v2/navbox/orders#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v2/navbox/orders/1').to route_to('api/v2/navbox/orders#destroy', id: '1')
    end
  end
end
