require 'rails_helper'

RSpec.describe Api::V2::Navbox::StoreCartsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v2/navbox/store_carts').to route_to('api/v2/navbox/store_carts#index')
    end

    it 'routes to #new' do
      expect(get: '/api/v2/navbox/store_carts/new').to route_to('api/v2/navbox/store_carts#new')
    end

    it 'routes to #show' do
      expect(get: '/api/v2/navbox/store_carts/1').to route_to('api/v2/navbox/store_carts#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/api/v2/navbox/store_carts/1/edit').to route_to('api/v2/navbox/store_carts#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v2/navbox/store_carts').to route_to('api/v2/navbox/store_carts#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v2/navbox/store_carts/1').to route_to('api/v2/navbox/store_carts#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v2/navbox/store_carts/1').to route_to('api/v2/navbox/store_carts#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v2/navbox/store_carts/1').to route_to('api/v2/navbox/store_carts#destroy', id: '1')
    end
  end
end
