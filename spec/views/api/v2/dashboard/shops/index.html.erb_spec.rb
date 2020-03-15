require 'rails_helper'

RSpec.describe 'api/v2/dashboard/shops/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_shops, [
             Api::V2::Dashboard::Shop.create!,
             Api::V2::Dashboard::Shop.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/shops' do
    render
  end
end
