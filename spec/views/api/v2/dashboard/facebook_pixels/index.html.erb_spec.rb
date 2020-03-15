require 'rails_helper'

RSpec.describe 'api/v2/dashboard/facebook_pixels/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_facebook_pixels, [
             Api::V2::Dashboard::FacebookPixel.create!,
             Api::V2::Dashboard::FacebookPixel.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/facebook_pixels' do
    render
  end
end
