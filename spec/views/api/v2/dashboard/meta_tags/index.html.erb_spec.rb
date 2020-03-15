require 'rails_helper'

RSpec.describe 'api/v2/dashboard/meta_tags/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_meta_tags, [
             Api::V2::Dashboard::MetaTag.create!,
             Api::V2::Dashboard::MetaTag.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/meta_tags' do
    render
  end
end
