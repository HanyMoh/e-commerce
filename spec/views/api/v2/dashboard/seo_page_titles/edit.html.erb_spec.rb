require 'rails_helper'

RSpec.describe 'api/v2/dashboard/seo_page_titles/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_seo_page_title = assign(:api / v2 / dashboard_seo_page_title, Api::V2::Dashboard::SeoPageTitle.create!)
  end

  it 'renders the edit api/v2/dashboard_seo_page_title form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_seo_page_title_path(@api / v2 / dashboard_seo_page_title), 'post' do
    end
  end
end
