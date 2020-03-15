require 'rails_helper'

RSpec.describe Api::V2::Navbox::OrganizationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/ipa/ver/sion/two/navbox/organizations').to route_to('api/v2/navbox/organizations#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: '/ipa/ver/sion/two/navbox/organizations/1').to route_to('api/v2/navbox/organizations#show', id: '1', format: :json)
    end

    it 'routes to #features' do
      expect(get: '/ipa/ver/sion/two/navbox/organizations/1/features').to route_to('api/v2/navbox/organizations#features', id: '1', format: :json)
    end
    #
    #     it 'routes to #create' do
    #       expect(post: '/ipa/ver/sion/two/dashboard/organizations').to route_to('api/v2/dashboard/organizations#create', format: :json)
    #     end
    #
    #     it 'routes to #update via PUT' do
    #       expect(put: '/ipa/ver/sion/two/dashboard/organizations/1').to route_to('api/v2/dashboard/organizations#update', id: '1', format: :json)
    #     end
    #
    #     it 'routes to #update via PATCH' do
    #       expect(patch: '/ipa/ver/sion/two/dashboard/organizations/1').to route_to('api/v2/dashboard/organizations#update', id: '1', format: :json)
    #     end
    #
    #     it 'routes to #destroy' do
    #       expect(delete: '/ipa/ver/sion/two/dashboard/organizations/1').to route_to('api/v2/dashboard/organizations#destroy', id: '1', format: :json)
    #     end
  end
end
