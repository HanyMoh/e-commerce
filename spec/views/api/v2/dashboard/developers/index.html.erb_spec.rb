require 'rails_helper'

RSpec.describe 'api/v2/dashboard/developers/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_developers, [
             Api::V2::Dashboard::Developer.create!,
             Api::V2::Dashboard::Developer.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/developers' do
    render
  end
end
