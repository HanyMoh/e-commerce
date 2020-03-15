require 'rails_helper'

RSpec.describe 'api/v2/dashboard/beacons/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_beacon, Api::V2::Dashboard::Beacon.new)
  end

  it 'renders new api/v2/dashboard_beacon form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_beacons_path, 'post' do
    end
  end
end
