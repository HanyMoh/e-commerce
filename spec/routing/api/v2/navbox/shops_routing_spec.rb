require 'rails_helper'

RSpec.describe Api::V2::Navbox::ShopsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/ipa/ver/sion/two/navbox/shops').to route_to('api/v2/navbox/shops#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: '/ipa/ver/sion/two/navbox/shops/1').to route_to('api/v2/navbox/shops#show', id: '1', format: :json)
    end

    it 'routes to #shop_by_name' do
      expect(get: '/ipa/ver/sion/two/navbox/shops/shop_by_name/ask').to route_to('api/v2/navbox/shops#shop_by_name', name: 'ask', format: :json)
    end
    #
    #     it 'routes to #create' do
    #       expect(post: '/ipa/ver/sion/two/navbox/shops').to route_to('api/v2/navbox/shops#create', format: :json)
    #     end
    #
    #     it 'routes to #update via PUT' do
    #       expect(put: '/ipa/ver/sion/two/navbox/shops/1').to route_to('api/v2/navbox/shops#update', id: '1', format: :json)
    #     end
    #
    #     it 'routes to #update via PATCH' do
    #       expect(patch: '/ipa/ver/sion/two/navbox/shops/1').to route_to('api/v2/navbox/shops#update', id: '1', format: :json)
    #     end
    #
    #     it 'routes to #destroy' do
    #       expect(delete: '/ipa/ver/sion/two/navbox/shops/1').to route_to('api/v2/navbox/shops#destroy', id: '1', format: :json)
    #     end
  end
end
