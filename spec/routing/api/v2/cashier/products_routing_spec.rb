require 'rails_helper'

RSpec.describe Api::V2::Cashier::ProductsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v2/cashier/products').to route_to('api/v2/cashier/products#index')
    end

    it 'routes to #new' do
      expect(get: '/api/v2/cashier/products/new').to route_to('api/v2/cashier/products#new')
    end

    it 'routes to #show' do
      expect(get: '/api/v2/cashier/products/1').to route_to('api/v2/cashier/products#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/api/v2/cashier/products/1/edit').to route_to('api/v2/cashier/products#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v2/cashier/products').to route_to('api/v2/cashier/products#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v2/cashier/products/1').to route_to('api/v2/cashier/products#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v2/cashier/products/1').to route_to('api/v2/cashier/products#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v2/cashier/products/1').to route_to('api/v2/cashier/products#destroy', id: '1')
    end
  end
end
