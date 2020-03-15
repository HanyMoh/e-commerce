require 'rails_helper'

RSpec.describe 'api/v2/dashboard/social_links/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_social_link, Api::V2::Dashboard::SocialLink.new)
  end

  it 'renders new api/v2/dashboard_social_link form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_social_links_path, 'post' do
    end
  end
end
