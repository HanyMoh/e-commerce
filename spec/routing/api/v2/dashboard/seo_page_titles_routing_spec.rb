require 'rails_helper'

RSpec.describe Api::V2::Dashboard::SeoPageTitlesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v2/dashboard/seo_page_titles').to route_to('api/v2/dashboard/seo_page_titles#index')
    end

    it 'routes to #new' do
      expect(get: '/api/v2/dashboard/seo_page_titles/new').to route_to('api/v2/dashboard/seo_page_titles#new')
    end

    it 'routes to #show' do
      expect(get: '/api/v2/dashboard/seo_page_titles/1').to route_to('api/v2/dashboard/seo_page_titles#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/api/v2/dashboard/seo_page_titles/1/edit').to route_to('api/v2/dashboard/seo_page_titles#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v2/dashboard/seo_page_titles').to route_to('api/v2/dashboard/seo_page_titles#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v2/dashboard/seo_page_titles/1').to route_to('api/v2/dashboard/seo_page_titles#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v2/dashboard/seo_page_titles/1').to route_to('api/v2/dashboard/seo_page_titles#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v2/dashboard/seo_page_titles/1').to route_to('api/v2/dashboard/seo_page_titles#destroy', id: '1')
    end
  end
end
