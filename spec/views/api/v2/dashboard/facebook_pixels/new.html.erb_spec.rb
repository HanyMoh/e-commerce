require 'rails_helper'

RSpec.describe 'api/v2/dashboard/facebook_pixels/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_facebook_pixel, Api::V2::Dashboard::FacebookPixel.new)
  end

  it 'renders new api/v2/dashboard_facebook_pixel form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_facebook_pixels_path, 'post' do
    end
  end
end
