require 'rails_helper'

RSpec.describe 'api/v2/dashboard/seo_page_titles/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_seo_page_titles, [
             Api::V2::Dashboard::SeoPageTitle.create!,
             Api::V2::Dashboard::SeoPageTitle.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/seo_page_titles' do
    render
  end
end
