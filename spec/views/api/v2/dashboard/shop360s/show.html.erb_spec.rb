require 'rails_helper'

RSpec.describe 'api/v2/dashboard/shop360s/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_shop360 = assign(:api / v2 / dashboard_shop360, Api::V2::Dashboard::Shop360.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
