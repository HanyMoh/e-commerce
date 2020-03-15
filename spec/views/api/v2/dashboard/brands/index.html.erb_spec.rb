require 'rails_helper'

RSpec.describe 'api/v2/dashboard/brands/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_brands, [
             Api::V2::Dashboard::Brand.create!,
             Api::V2::Dashboard::Brand.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/brands' do
    render
  end
end
