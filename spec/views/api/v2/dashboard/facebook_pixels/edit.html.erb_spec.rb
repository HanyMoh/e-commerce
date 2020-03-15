require 'rails_helper'

RSpec.describe 'api/v2/dashboard/facebook_pixels/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_facebook_pixel = assign(:api / v2 / dashboard_facebook_pixel, Api::V2::Dashboard::FacebookPixel.create!)
  end

  it 'renders the edit api/v2/dashboard_facebook_pixel form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_facebook_pixel_path(@api / v2 / dashboard_facebook_pixel), 'post' do
    end
  end
end
