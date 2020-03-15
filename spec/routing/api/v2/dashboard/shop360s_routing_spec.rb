require 'rails_helper'

RSpec.describe Api::V2::Dashboard::Shop360sController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v2/dashboard/shop360s').to route_to('api/v2/dashboard/shop360s#index')
    end

    it 'routes to #new' do
      expect(get: '/api/v2/dashboard/shop360s/new').to route_to('api/v2/dashboard/shop360s#new')
    end

    it 'routes to #show' do
      expect(get: '/api/v2/dashboard/shop360s/1').to route_to('api/v2/dashboard/shop360s#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/api/v2/dashboard/shop360s/1/edit').to route_to('api/v2/dashboard/shop360s#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v2/dashboard/shop360s').to route_to('api/v2/dashboard/shop360s#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v2/dashboard/shop360s/1').to route_to('api/v2/dashboard/shop360s#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v2/dashboard/shop360s/1').to route_to('api/v2/dashboard/shop360s#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v2/dashboard/shop360s/1').to route_to('api/v2/dashboard/shop360s#destroy', id: '1')
    end
  end
end
