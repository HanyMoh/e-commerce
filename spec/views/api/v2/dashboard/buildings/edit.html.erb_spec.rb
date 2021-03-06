require 'rails_helper'

RSpec.describe 'api/v2/dashboard/buildings/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_building = assign(:api / v2 / dashboard_building, Api::V2::Dashboard::Building.create!)
  end

  it 'renders the edit api/v2/dashboard_building form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_building_path(@api / v2 / dashboard_building), 'post' do
    end
  end
end
