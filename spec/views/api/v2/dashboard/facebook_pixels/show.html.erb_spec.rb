require 'rails_helper'

RSpec.describe 'api/v2/dashboard/facebook_pixels/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_facebook_pixel = assign(:api / v2 / dashboard_facebook_pixel, Api::V2::Dashboard::FacebookPixel.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
