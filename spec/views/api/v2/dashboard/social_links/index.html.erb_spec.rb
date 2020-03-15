require 'rails_helper'

RSpec.describe 'api/v2/dashboard/social_links/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_social_links, [
             Api::V2::Dashboard::SocialLink.create!,
             Api::V2::Dashboard::SocialLink.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/social_links' do
    render
  end
end
