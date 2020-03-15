require 'rails_helper'

RSpec.describe 'api/v2/dashboard/beacons/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_beacons, [
             Api::V2::Dashboard::Beacon.create!,
             Api::V2::Dashboard::Beacon.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/beacons' do
    render
  end
end
