require 'rails_helper'

RSpec.describe 'api/v2/dashboard/meta_tags/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_meta_tag = assign(:api / v2 / dashboard_meta_tag, Api::V2::Dashboard::MetaTag.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
