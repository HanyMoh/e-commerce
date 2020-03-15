require 'rails_helper'

RSpec.describe 'api/v2/dashboard/sections/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_section, Api::V2::Dashboard::Section.new)
  end

  it 'renders new api/v2/dashboard_section form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_sections_path, 'post' do
    end
  end
end
