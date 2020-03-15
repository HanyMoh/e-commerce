require 'rails_helper'

RSpec.describe Api::V2::Dashboard::OrganizationThemesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v2/dashboard/organization_themes').to route_to('api/v2/dashboard/organization_themes#index')
    end

    it 'routes to #new' do
      expect(get: '/api/v2/dashboard/organization_themes/new').to route_to('api/v2/dashboard/organization_themes#new')
    end

    it 'routes to #show' do
      expect(get: '/api/v2/dashboard/organization_themes/1').to route_to('api/v2/dashboard/organization_themes#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/api/v2/dashboard/organization_themes/1/edit').to route_to('api/v2/dashboard/organization_themes#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v2/dashboard/organization_themes').to route_to('api/v2/dashboard/organization_themes#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v2/dashboard/organization_themes/1').to route_to('api/v2/dashboard/organization_themes#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v2/dashboard/organization_themes/1').to route_to('api/v2/dashboard/organization_themes#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v2/dashboard/organization_themes/1').to route_to('api/v2/dashboard/organization_themes#destroy', id: '1')
    end
  end
end
