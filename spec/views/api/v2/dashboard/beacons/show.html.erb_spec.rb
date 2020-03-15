require 'rails_helper'

RSpec.describe 'api/v2/dashboard/beacons/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_beacon = assign(:api / v2 / dashboard_beacon, Api::V2::Dashboard::Beacon.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
