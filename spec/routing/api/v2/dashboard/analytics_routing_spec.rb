require 'rails_helper'

RSpec.describe Api::V2::Dashboard::AnalyticsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v2/dashboard/analytics').to route_to('api/v2/dashboard/analytics#index')
    end

    it 'routes to #new' do
      expect(get: '/api/v2/dashboard/analytics/new').to route_to('api/v2/dashboard/analytics#new')
    end

    it 'routes to #show' do
      expect(get: '/api/v2/dashboard/analytics/1').to route_to('api/v2/dashboard/analytics#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/api/v2/dashboard/analytics/1/edit').to route_to('api/v2/dashboard/analytics#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v2/dashboard/analytics').to route_to('api/v2/dashboard/analytics#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v2/dashboard/analytics/1').to route_to('api/v2/dashboard/analytics#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v2/dashboard/analytics/1').to route_to('api/v2/dashboard/analytics#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v2/dashboard/analytics/1').to route_to('api/v2/dashboard/analytics#destroy', id: '1')
    end
  end
end
