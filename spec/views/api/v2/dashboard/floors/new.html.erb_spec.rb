require 'rails_helper'

RSpec.describe 'api/v2/dashboard/floors/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_floor, Api::V2::Dashboard::Floor.new)
  end

  it 'renders new api/v2/dashboard_floor form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_floors_path, 'post' do
    end
  end
end
