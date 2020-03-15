require 'rails_helper'

RSpec.describe 'api/v2/dashboard/social_links/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_social_link = assign(:api / v2 / dashboard_social_link, Api::V2::Dashboard::SocialLink.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
