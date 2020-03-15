require 'rails_helper'

RSpec.describe 'api/v2/dashboard/seo_page_titles/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_seo_page_title, Api::V2::Dashboard::SeoPageTitle.new)
  end

  it 'renders new api/v2/dashboard_seo_page_title form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_seo_page_titles_path, 'post' do
    end
  end
end
