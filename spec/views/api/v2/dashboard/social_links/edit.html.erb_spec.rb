require 'rails_helper'

RSpec.describe 'api/v2/dashboard/social_links/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_social_link = assign(:api / v2 / dashboard_social_link, Api::V2::Dashboard::SocialLink.create!)
  end

  it 'renders the edit api/v2/dashboard_social_link form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_social_link_path(@api / v2 / dashboard_social_link), 'post' do
    end
  end
end
