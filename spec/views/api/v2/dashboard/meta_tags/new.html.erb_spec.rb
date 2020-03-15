require 'rails_helper'

RSpec.describe 'api/v2/dashboard/meta_tags/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_meta_tag, Api::V2::Dashboard::MetaTag.new)
  end

  it 'renders new api/v2/dashboard_meta_tag form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_meta_tags_path, 'post' do
    end
  end
end
