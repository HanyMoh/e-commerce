require 'rails_helper'

RSpec.describe 'api/v2/dashboard/floors/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_floors, [
             Api::V2::Dashboard::Floor.create!,
             Api::V2::Dashboard::Floor.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/floors' do
    render
  end
end
