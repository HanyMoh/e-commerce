require 'rails_helper'

RSpec.describe 'api/v2/dashboard/sections/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_section = assign(:api / v2 / dashboard_section, Api::V2::Dashboard::Section.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
