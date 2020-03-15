require 'rails_helper'

RSpec.describe 'api/v2/dashboard/shop360s/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_shop360s, [
             Api::V2::Dashboard::Shop360.create!,
             Api::V2::Dashboard::Shop360.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/shop360s' do
    render
  end
end
