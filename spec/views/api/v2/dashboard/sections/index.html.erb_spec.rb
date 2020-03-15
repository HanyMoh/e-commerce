require 'rails_helper'

RSpec.describe 'api/v2/dashboard/sections/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_sections, [
             Api::V2::Dashboard::Section.create!,
             Api::V2::Dashboard::Section.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/sections' do
    render
  end
end
