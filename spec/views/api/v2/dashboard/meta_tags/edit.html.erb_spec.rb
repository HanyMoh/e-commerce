require 'rails_helper'

RSpec.describe 'api/v2/dashboard/meta_tags/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_meta_tag = assign(:api / v2 / dashboard_meta_tag, Api::V2::Dashboard::MetaTag.create!)
  end

  it 'renders the edit api/v2/dashboard_meta_tag form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_meta_tag_path(@api / v2 / dashboard_meta_tag), 'post' do
    end
  end
end
