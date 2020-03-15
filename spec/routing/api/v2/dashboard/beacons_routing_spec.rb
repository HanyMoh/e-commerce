require 'rails_helper'

RSpec.describe Api::V2::Dashboard::BeaconsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v2/dashboard/beacons').to route_to('api/v2/dashboard/beacons#index')
    end

    it 'routes to #new' do
      expect(get: '/api/v2/dashboard/beacons/new').to route_to('api/v2/dashboard/beacons#new')
    end

    it 'routes to #show' do
      expect(get: '/api/v2/dashboard/beacons/1').to route_to('api/v2/dashboard/beacons#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/api/v2/dashboard/beacons/1/edit').to route_to('api/v2/dashboard/beacons#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v2/dashboard/beacons').to route_to('api/v2/dashboard/beacons#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v2/dashboard/beacons/1').to route_to('api/v2/dashboard/beacons#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v2/dashboard/beacons/1').to route_to('api/v2/dashboard/beacons#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v2/dashboard/beacons/1').to route_to('api/v2/dashboard/beacons#destroy', id: '1')
    end
  end
end
