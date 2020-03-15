require 'rails_helper'

RSpec.describe 'api/v2/dashboard/sections/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_section = assign(:api / v2 / dashboard_section, Api::V2::Dashboard::Section.create!)
  end

  it 'renders the edit api/v2/dashboard_section form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_section_path(@api / v2 / dashboard_section), 'post' do
    end
  end
end
