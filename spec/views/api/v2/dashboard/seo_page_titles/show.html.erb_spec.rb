require 'rails_helper'

RSpec.describe 'api/v2/dashboard/seo_page_titles/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_seo_page_title = assign(:api / v2 / dashboard_seo_page_title, Api::V2::Dashboard::SeoPageTitle.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
