require 'rails_helper'

RSpec.describe Api::V2::Navbox::SocialMediaController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/ipa/ver/sion/two/navbox/social-media-registration').to route_to('api/v2/navbox/social_media#create', format: :json)
    end
  end
end
