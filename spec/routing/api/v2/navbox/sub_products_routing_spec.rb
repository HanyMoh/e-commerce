require 'rails_helper'

RSpec.describe Api::V2::Navbox::SubProductsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v2/navbox/sub_products').to route_to('api/v2/navbox/sub_products#index')
    end

    it 'routes to #new' do
      expect(get: '/api/v2/navbox/sub_products/new').to route_to('api/v2/navbox/sub_products#new')
    end

    it 'routes to #show' do
      expect(get: '/api/v2/navbox/sub_products/1').to route_to('api/v2/navbox/sub_products#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/api/v2/navbox/sub_products/1/edit').to route_to('api/v2/navbox/sub_products#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v2/navbox/sub_products').to route_to('api/v2/navbox/sub_products#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v2/navbox/sub_products/1').to route_to('api/v2/navbox/sub_products#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v2/navbox/sub_products/1').to route_to('api/v2/navbox/sub_products#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v2/navbox/sub_products/1').to route_to('api/v2/navbox/sub_products#destroy', id: '1')
    end
  end
end
