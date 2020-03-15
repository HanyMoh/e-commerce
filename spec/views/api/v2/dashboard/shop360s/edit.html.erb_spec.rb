require 'rails_helper'

RSpec.describe 'api/v2/dashboard/shop360s/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_shop360 = assign(:api / v2 / dashboard_shop360, Api::V2::Dashboard::Shop360.create!)
  end

  it 'renders the edit api/v2/dashboard_shop360 form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_shop360_path(@api / v2 / dashboard_shop360), 'post' do
    end
  end
end
