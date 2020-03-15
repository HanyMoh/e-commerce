require 'rails_helper'

RSpec.describe Api::V2::Dashboard::ShopsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v2/dashboard/shops').to route_to('api/v2/dashboard/shops#index')
    end

    it 'routes to #new' do
      expect(get: '/api/v2/dashboard/shops/new').to route_to('api/v2/dashboard/shops#new')
    end

    it 'routes to #show' do
      expect(get: '/api/v2/dashboard/shops/1').to route_to('api/v2/dashboard/shops#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/api/v2/dashboard/shops/1/edit').to route_to('api/v2/dashboard/shops#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v2/dashboard/shops').to route_to('api/v2/dashboard/shops#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v2/dashboard/shops/1').to route_to('api/v2/dashboard/shops#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v2/dashboard/shops/1').to route_to('api/v2/dashboard/shops#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v2/dashboard/shops/1').to route_to('api/v2/dashboard/shops#destroy', id: '1')
    end
  end
end
