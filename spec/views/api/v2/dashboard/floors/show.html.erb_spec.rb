require 'rails_helper'

RSpec.describe 'api/v2/dashboard/floors/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_floor = assign(:api / v2 / dashboard_floor, Api::V2::Dashboard::Floor.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
