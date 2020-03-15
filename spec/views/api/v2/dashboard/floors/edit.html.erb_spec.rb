require 'rails_helper'

RSpec.describe 'api/v2/dashboard/floors/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_floor = assign(:api / v2 / dashboard_floor, Api::V2::Dashboard::Floor.create!)
  end

  it 'renders the edit api/v2/dashboard_floor form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_floor_path(@api / v2 / dashboard_floor), 'post' do
    end
  end
end
