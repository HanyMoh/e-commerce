require 'rails_helper'

RSpec.describe 'api/v2/dashboard/beacons/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_beacon = assign(:api / v2 / dashboard_beacon, Api::V2::Dashboard::Beacon.create!)
  end

  it 'renders the edit api/v2/dashboard_beacon form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_beacon_path(@api / v2 / dashboard_beacon), 'post' do
    end
  end
end
